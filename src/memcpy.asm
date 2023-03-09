BITS 64 ; 64-bits mode

section .text
    global memcpy ; The "memcpy" function must be callable outside

memcpy:
    ; "rdi" corresponds to the destination string
    ; "rsi" corresponds to the source string
    ; "rdx" corresponds to the number of characters to copy

    mov rax, rdi ; The return value is the destination string

    call memcpy_loop

memcpy_loop:
    cmp rdx, 0
    je memcpy_end ; If the index is 0, we stop

    mov bh, [rsi] ; We not use "al" because "rax" is the return value, and "bl" becuase it's proctected
    mov [rdi], bh ; Replaces the current character (only first byte)

    dec rdx ; Decrements the index
    inc rsi ; Moves to the next character (source)
    inc rdi ; Moves to the next character (destination)

    jmp memcpy_loop ; Recursivity

memcpy_end:
    ret
