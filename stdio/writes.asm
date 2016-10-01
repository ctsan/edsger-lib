.intel_syntax noprefix
            .global _writeString

_writeString:
            push    rbp
            mov     rbp, rsp
            push    rdi
            push    rsi

            mov     rdi, [rbp+32]
            mov     rsi, rdi
            xor     rax, rax
calcLen:
            cmp     byte ptr [rsi], 0x0
            jz      doPrint
            inc     rax
            inc     rsi
            jmp     calcLen
doPrint:
            mov     rsi, rdi
            mov     rdi, 1
            mov     rdx, rax
            mov     rax, 0x1 ; For Mac 0x2000004
            syscall
ok:
            pop     rsi
            pop     rdi
            pop     rbp
            ret
