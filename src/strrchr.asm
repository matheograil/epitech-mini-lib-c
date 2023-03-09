BITS 64 ; 64-bits mode

section .text
    global strrchr ; The "strrchr" function must be callable outside

strrchr:
    mov rbx, -1 ; Initializes the search index to -1 (nothing has been found yet)
    mov rdx, 0 ; Initializes the index to 0
    mov rcx, rdi ; Saves the string into another register to conserve the original one

    call strrchr_loop

strrchr_loop:
    cmp [rcx], byte 0
    je strrchr_compute ; If the current character is null, we continue to the computation

    cmp [rcx], sil
    je strrchr_loop_save_index ; If the current character corresponds to the one we are looking for, we save the index

    inc rcx ; Moves to the next character
    inc rdx ; Increments the index

    jmp strrchr_loop ; Recursivity

strrchr_loop_save_index:
    mov rbx, rdx

    inc rcx
    inc rdx

    jmp strrchr_loop ; After saving the index, we continue to the next character

strrchr_compute:
    cmp rbx, -1
    je strrchr_not_found ; If the index is still -1, it means that the character has not been found

    mov rax, rdi
    add rax, rbx ; Otherwise, we return the character at the right index
    ret

strrchr_not_found:
    mov rax, 0
    ret
