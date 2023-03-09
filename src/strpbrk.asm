BITS 64 ; 64-bits mode

section .text
    global strpbrk ; The "strpbrk" function must be callable outside

strpbrk:
    ; "rdi" corresponds to the string
    ; "rsi" corresponds to the query

    cmp [rdi], byte 0
    je strpbrk_end ; At the end of the string, returns NULL

    mov rdx, rsi ; Saves the query address

    call strpbrk_search_loop

    mov rsi, rdx ; Restores the query address

    cmp bl, 1
    je strpbrk_found ; If the character is found, returns a pointer to current character (string)

    inc rdi ; Moves to the next character (string)

    jmp strpbrk ; Recursivity

strpbrk_found:
    mov rax, rdi
    ret

strpbrk_end:
    mov rax, 0
    ret

strpbrk_search_loop:
    cmp [rsi], byte 0
    je strpbrk_search_end ; At the end of the query, returns "0"

    mov al, [rdi]
    mov ah, [rsi]
    cmp al, ah
    je strpbrk_search_found ; If the character is found, returns "1"

    inc rsi ; Moves to the next character (query)

    jmp strpbrk_search_loop ; Recursivity

strpbrk_search_end:
    mov bl, 0
    ret

strpbrk_search_found:
    mov bl, 1
    ret