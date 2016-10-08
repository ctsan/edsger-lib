/* void writeBoolean (bool b);
; ---------------------------
; This function prints a boolean to the standard output.
; One of the strings 'true' and 'false' is printed.*/

.intel_syntax noprefix
            .text
            .global  _writeBoolean

_writeBoolean: push  rbp
              mov   rbp, rsp
              push  rsi
              sub   rsp, 2
              mov   rax, 1              // write
              movzx edi, byte ptr [rbp+32] //Get byte argument into rdi
              mov   r8b, dil
              mov   rdi, 1              // to stdout
              or    r8b, r8b            // check if arg is true or false
              jnz   par_true
              mov   byte ptr [rsp], 0x66 //write 'f'
              jmp   short ok
par_true:
              mov   byte ptr [rsp], 0x74 //write 't'
ok:
              mov   byte ptr [rsp+1], 0x0A
              mov   rax, SYSCALL_WRITE
              mov   rdi, 1
              lea   rsi, [rsp]
              mov   rdx, 1
              syscall
              add   rsp,2
              pop   rsi
              pop   rbp
              ret
