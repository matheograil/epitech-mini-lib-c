BITS 64 ; 64-bits mode

section .text
    global memset ; The "memset" function must be callable outside

memset:
    ; "rdi" corresponds to the string
    ; "rsi" corresponds to the character to set
    ; "rdx" corresponds to the number of characters to set

    mov rax, rdi ; The return value is the same string as the parameter

    call memset_loop

memset_loop:
    cmp rdx, 0
    je memset_end ; If the index is 0, we stop

    mov [rdi], sil ; Replaces the current character (only first byte)

    inc rdi ; Moves to the next character
    dec rdx ; Decrements the index

    jmp memset_loop ; Recursivity

memset_end:
    ret