/* function formatInteger (var buffer : array of char; i : integer;
                         width, flags, base : byte) : byte
 ----------------------------------------------------------------
 This procedure formats an integer for printing.
*/ 

.intel_syntax noprefix
.text
.global _formatInteger

/*CHAR_SPACEPAD  equ     ' '
FLAG_LEFTALIGN equ     00h
FLAG_ZEROPAD   equ     02h
FLAG_UPPERCASE equ     40h*/


_formatInteger:
            push    rbp
            mov     rbp, rsp
            push    rdi
            push    rsi
            push    rbx
            mov     rdx, 0
            mov     r8, 0
            mov     ax, si
            and     ax, 0x8000         
            jz      prepare
            not     si
            inc     si
            mov     byte ptr [rdi], '-'
            inc     rdi
prepare:
            mov     ax, 10000
            mov     cx, 0
            mov     bx, 0
digit:
            cmp     si, ax
            jb      mWriteDigit
            inc     bx
            sub     si, ax
            jmp     digit
mWriteDigit:
            cmp     bx, 0
            jne     writeDigit
            cmp     r8, 0
            je      nextDigit
writeDigit:
            call    writeDigitToMemory
nextDigit:
            mov     bx, 10
            div     bx
            cmp     ax, 0
            je      finish
            mov     bx, 0
            cmp     ax, 1
            jne     digit
            mov     r8, 1
            jmp     digit

finish:
            mov     byte ptr [rdi], 0x0
            pop     rbx
            pop     rsi
            pop     rdi
            pop     rbp
            mov     ax, cx              /*return number of characters written*/
            and     rax, 0xff
            ret

writeDigitToMemory:
            push    rbp
            mov     rbp, rsp
            mov     r8, 1
            add     bl, 0x30
            mov     byte ptr [rdi], bl
            inc     rdi
            inc     cx
            mov     bx, 0
            pop     rbp
            ret
