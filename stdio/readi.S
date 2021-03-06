.intel_syntax noprefix
 /* 
 int readInteger ();
 -------------------
 This function reads an integer from the standard input
 and returns it.  A whole line (of up to MAXSTRING characters)
 is actually read by a call to readString.  Leading spaces are
 ommited.  If the line does not contain a valid number, 0 is
 returned (same behaviour as 'atoi' in C).
 */

.text
.global    _readInteger
.extern    _readRegString
.extern    _parseInteger

_readInteger:   push    rbp
                mov     rbp, rsp

                mov     rdi, 256
                lea     rsi, [rip+inpstr]
                call    _readRegString              /* Read a string */
                
                mov     rdi, rsi                 /* buffer as first argument */
                lea     rsi, [rip+readint]           /* location of read integer in memory */
                mov     r8, 10                   /* base = 10 */
                call    _parseInteger            /* result in rax */

                mov     ax, word ptr [rsi]
                mov     rdi, [rbp+24]         /* addr of result */
                mov     word ptr [rdi], ax    /* store result */

                mov     rsp, rbp
                pop     rbp
                ret
.bss
.lcomm inpstr,256 /* Max String */
.lcomm readint,2  /* Int Size */
