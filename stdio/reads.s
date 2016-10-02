# void readString (int size, char * s);
# -------------------------------------
# This function reads a line from the standard input
# and stores it into string 's'.  The newline character
# is not stored.  Up to 'size' characters can be read.
# This function skips control characters and correctly
# treats the backspace character.  Finally, a '\0' is
# always appended.  Assumes that size > 0.

.intel_syntax noprefix
                .text
                .global _readString

_readString:
                push    rbp
                mov     rbp, rsp
                push    rdi
                push    rsi

                mov     di,  [rbp+40]
                and     rdi, 0xffff
                mov     rsi, [rbp+32]


                mov     rdx, rdi

doRead:
                mov     byte ptr [rsi], 0x00
                xor     rax, rax
                mov     rdi, rax
                #mov     rax, 0x2000003          # for MACOS
                syscall                         # read syscall, reads up to $rdx bytes
                or      rax, rax                # nothing read
                jz      finish                  #
                add     rsi, rax                #
                cmp     byte ptr [rsi-1], 0x0a  # check if last character read was '\n'
                jne     addZero                 #
                sub     rsi, 1                  # if so, replace with '\0'
addZero:
                mov     byte ptr [rsi], 0x00
finish:
                pop     rsi
                pop     rdi
                pop     rbp
                ret