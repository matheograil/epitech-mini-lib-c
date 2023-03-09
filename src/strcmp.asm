BITS 64 ; 64-bits mode

section .text
    global strcmp ; The "strcmp" function must be callable outside

strcmp:
    ; "rdi" corresponds to the first string
    ; "rsi" corresponds to the second string

    mov al, [rdi] ; Stores the current character (first string)
    mov ah, [rsi] ; Stores the current character (second string)

    cmp al, 0 ; Checks if the first string is finished
    je strcmp_end_first
    cmp ah, 0 ; Checks if the second string is finished
    je strcmp_end_second

    cmp al, ah ; Compares the current characters
    je strcmp_equal
    ja strcmp_greater
    jb strcmp_lower

strcmp_equal:
    inc rdi ; Moves to the next character (first string)
    inc rsi ; Moves to the next character (second string)

    jmp strcmp ; Recursivity

strcmp_greater:
    mov rax, 1
    ret

strcmp_lower:
    mov rax, -1
    ret

strcmp_end_first:
    cmp ah, 0 ; Checks if the both strings are finished
    je strcmp_end_both

    mov rax, -1
    ret

strcmp_end_second:
    cmp al, 0 ; Checks if the both strings are finished
    je strcmp_end_both

    mov rax, 1
    ret

strcmp_end_both:
    mov rax, 0
    ret
