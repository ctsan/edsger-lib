.global _main
_main:
	pushq %rbp
	movq %rsp,%rbp
	subq $8,%rsp

.$1:
	movw $0,%ax
	movw %ax,-2(%rbp)

.$2:
	movw -2(%rbp),%ax
	movw $100,%dx
	cmp %ax,%dx
	jl .$4

.$3:
	jmp .$10

.$4:
	movw -2(%rbp),%ax
	movw $1,%dx
	addw %dx,%ax
	movw %ax,-4(%rbp)

.$5:
	movw -4(%rbp),%ax
	movw %ax,-2(%rbp)

.$6:
	movw -2(%rbp),%ax
	movw %ax,-6(%rbp)

.$7:
	movw -2(%rbp),%ax
	movw $1,%dx
	addw %dx,%ax
	movw %ax,-8(%rbp)

.$8:
	movw -8(%rbp),%ax
	movw %ax,-2(%rbp)

.$9:
	jmp .$2

.$10:
.$main_0_1:
	movq %rbp,%rsp
	popq %rbp
	ret

