/* void writeChar (char c);
 ------------------------
 This function prints a character to the standard output. */

#include OS_SYSCALL_NUMS
.intel_syntax noprefix

.text
.globl _writeChar

_writeChar:  push  rbp
            mov   rbp, rsp

            movzx edi, byte ptr [rbp+32]  /* Get Byte Argument into rdi */

            or    dil, dil
            jz    ok
normal:
            sub     rsp, 2
            mov     byte ptr [rsp], dil
            mov     byte ptr [rsp+1], 0x0A
            mov     rax, SYSCALL_WRITE                 /*  write syscall */
            mov     rdi, 1                 /* to stdout */
            lea     rsi, [rsp]             /* location of character to print in mem */
            mov     rdx, 1                 /* print 1 character */
            syscall
            add     rsp,2
ok:
            pop   rbp
            ret
