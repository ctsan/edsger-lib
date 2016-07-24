; char readChar ();
; -----------------
; This function reads a character from the standard input
; and returns it.


            section .code
            global  _readChar

_readChar   push    rbp
            mov     rbp, rsp
            push    rdi
            sub     rsp, 4
            mov     rsi, rsp                  ; store on stack
            mov     rdx, 1                    ; read single character
            mov     rdi, 0                    ; from stdin
            mov     rax, 0                    ; using the read() syscall
            syscall
            xor     rax, rax                  ; store it
            mov     al, byte [rsp]
            add     rsp, 4
            pop     rdi
            pop     rbp
            ret
