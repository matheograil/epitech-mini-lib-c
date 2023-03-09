BITS 64 ; 64-bits mode

section .text
    global strchr ; The "strchr" function must be callable outside

strchr:
    cmp [rdi], sil
    je strchr_found ; If the current character corresponds to the one we are looking for, returns a pointer to it

    cmp [rdi], byte 0
    je strchr_not_found ; If the current character is null, returns a null pointer

    inc rdi ; Moves to the next character

    jmp strchr ; Recursivity

strchr_found:
    mov rax, rdi
    ret

strchr_not_found:
    mov rax, 0
    ret
