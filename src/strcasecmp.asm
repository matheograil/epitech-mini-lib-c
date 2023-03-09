BITS 64 ; 64-bits mode

section .text
    global strcasecmp ; The "strcasecmp" function must be callable outside

strcasecmp:
    ; "rdi" corresponds to the first string
    ; "rsi" corresponds to the second string

    mov al, [rdi] ; Stores the current character (first string)
    mov ah, [rsi] ; Stores the current character (second string)

    cmp al, 0 ; Checks if the first string is finished
    je strcasecmp_end_first
    cmp ah, 0 ; Checks if the second string is finished
    je strcasecmp_end_second

    or al, 32 ; Converts the current character to lowercase (first string)
    or ah, 32 ; Converts the current character to lowercase (second string)

    cmp al, ah ; Compares the current characters
    je strcasecmp_equal
    ja strcasecmp_greater
    jb strcasecmp_lower

strcasecmp_equal:
    inc rdi ; Moves to the next character (first string)
    inc rsi ; Moves to the next character (second string)

    jmp strcasecmp ; Recursivity

strcasecmp_greater:
    mov rax, 1
    ret

strcasecmp_lower:
    mov rax, -1
    ret

strcasecmp_end_first:
    cmp ah, 0 ; Checks if the both strings are finished
    je strcasecmp_end_both

    mov rax, -1
    ret

strcasecmp_end_second:
    cmp al, 0 ; Checks if the both strings are finished
    je strcasecmp_end_both

    mov rax, 1
    ret

strcasecmp_end_both:
    mov rax, 0
    ret
