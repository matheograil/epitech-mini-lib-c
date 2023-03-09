BITS 64 ; 64-bits mode

section .text
    global strncmp ; The "strncmp" function must be callable outside

strncmp:
    ; "rdi" corresponds to the first string
    ; "rsi" corresponds to the second string
    ; "rdx" corresponds to the number of characters to compare

    mov al, [rdi] ; Stores the current character (first string)
    mov ah, [rsi] ; Stores the current character (second string)

    cmp al, 0 ; Checks if the first string is finished
    je strncmp_end_first
    cmp ah, 0 ; Checks if the second string is finished
    je strncmp_end_second

    cmp rdx, 1
    je strncmp_end_both

    cmp al, ah ; Compares the current characters
    je strncmp_equal
    ja strncmp_greater
    jb strncmp_lower

strncmp_equal:
    inc rdi ; Moves to the next character (first string)
    inc rsi ; Moves to the next character (second string)
    dec rdx ; Decreases the number of characters to compare

    jmp strncmp ; Recursivity

strncmp_greater:
    mov rax, 1
    ret

strncmp_lower:
    mov rax, -1
    ret

strncmp_end_first:
    cmp ah, 0 ; Checks if the both strings are finished
    je strncmp_end_both

    mov rax, -1
    ret

strncmp_end_second:
    cmp al, 0 ; Checks if the both strings are finished
    je strncmp_end_both

    mov rax, 1
    ret

strncmp_end_both:
    mov rax, 0
    ret
