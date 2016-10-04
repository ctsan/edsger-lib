.intel_syntax noprefix
                .text
                .global  _writeInteger
                .extern  _formatInteger
                .extern  _writeString

_writeInteger:  push    rbp
                mov     rbp, rsp
                push    rdi
                push    rsi
                
                mov     rdi, [rbp+32]
                mov     rsi, rdi 
                lea     rdi, [buffer]
                call    _formatInteger
                
                lea     rdi, [buffer]
                call    _writeString
                
                pop     rsi
                pop     rdi
                mov     rsp, rbp
                pop     rbp
                ret

                .section bss
.lcomm buffer, 7 
