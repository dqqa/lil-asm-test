.section .rodata
fmt:
    .string "fib(%02d) = %ld\n"

.section .text
.globl fib
fib:
    mov %edi, %eax
    xor %esi, %esi
    mov $0, %ebx
    mov $1, %ecx
    loop_start:
    cmp %eax, %esi
    je loop_end

    mov %ecx, %edx
    add %ebx, %ecx
    mov %edx, %ebx

    inc %esi
    jmp loop_start
    loop_end:
    mov %ebx, %eax
    ret

.globl fact
fact:
    mov %edi, %eax
    xor %esi, %esi
    mov $1, %ebx
    loop_start2:
    cmp %eax, %esi
    je loop_end2
    lea 1(%esi), %rcx
    imul %rcx, %rbx

    inc %esi
    jmp loop_start2
    loop_end2:
    mov %rbx, %rax
    ret

.globl do_stuff
do_stuff:
    push %rbp
    mov %rsp, %rbp
    sub $16, %rsp
    movl $0, -4(%rbp)
    main_loop_start:
    cmpl $30, -4(%rbp)
    je main_loop_end

    movl -4(%rbp), %edi
    call fib
    mov %rax, %rdx
    movl -4(%rbp), %esi
    lea fmt(%rip), %rdi
    xor %eax, %eax
    call printf

    addl $1, -4(%rbp)
    jmp main_loop_start
    main_loop_end:
    xor %eax, %eax
    add $16, %rsp
    pop %rbp
    ret

.globl tick
tick:
    rdtsc
    shl $32, %rdx
    or %rdx, %rax
    ret

.section .note.GNU-stack # missing .note.GNU-stack section implies executable stack
