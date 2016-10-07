SHELL=/bin/bash
LIBNAME=lib.a

########################### DETECT OS

ifeq ($(OS),Windows_NT)
	$(error no support for windows!)
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
	OS_NUMS=lin_syscalls.h
    endif
    ifeq ($(UNAME_S),Darwin)
	OS_NUMS=mac_syscalls.h
    endif
endif

########################### Basic Target

deps := $(wildcard **/*.S)

.PHONY:all

all: 
	# Compile All
	@for file in **/*.S; \
	do \
		dir=`dirname $$file`; \
		cd $$dir; \
		gcc -g -c `basename $$file` -D 'OS_SYSCALL_NUMS="../${OS_NUMS}"'; \
		cd ..; \
	done
	@ar -cvqs ${LIBNAME} auxil/*.o stdio/*.o # Make a lib 
	#@rm **/*.o 	               # Clean
	@echo "DONE!"

clean: 
	@rm ${LIBNAME}
	@echo "DONE!"
