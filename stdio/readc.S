/* char readChar ();
 -----------------
 This function reads a character from the standard input
 and returns it.
*/

#include OS_SYSCALL_NUMS

.intel_syntax noprefix
                .text
                .global _readChar

_readChar:  
            push    rax
            push    rbp
            mov     rbp, rsp
            push    rdi

            sub     rsp, 4
            mov     rsi, rsp                  /* store on stack */
            mov     rdx, 1                    /* read single character */
            mov     rdi, 0                    /* from stdin */
            mov     rax, SYSCALL_READ         /* using the read() syscall */
            syscall

            mov     al, [rsp]                 /* Result */
            mov     rdi,[rbp+24]              /* Addr of result*/
            mov     byte ptr [rdi], al        /* Store */

            add     rsp, 4

            pop     rdi
            pop     rbp
            pop     rax 
            ret
