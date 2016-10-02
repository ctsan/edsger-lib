/*
 * Call: void edsger_exit(int code); 
 * Implementation of the syscall sys_exit(). 
 */

.global _edsger_exit


_edsger_exit :
	pushq %rsp
	movq %rbp, %rsp /* Fix stack pointer */

	pushq %rax
	pushq %rdi

	movq $2000001, %rax	/* System call number */

/*
 * 54 bytes from stack top:
 * 16 for %rax, %rdi in stack, 
 * 16 for %rbp, %rsp in stack, 
 * 16 for return address, access link,
 * 2 for arg1
 */

	xorq %rdi,%rdi
	movw 32(%rbp), %di 
	syscall

/* Unreachable */

	popq %rdi
	popq %rax
	popq %rsp

	ret	
