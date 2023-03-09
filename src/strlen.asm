BITS 64 ; 64-bits mode

section .text
    global strlen ; The "strlen" function must be callable outside

strlen:
    mov rax, 0 ; Initializes the counter to 0

    call strlen_loop ; Calls the "strlen_loop" function

strlen_loop:
    cmp [rdi], byte 0 ; Is the current character equal to 0 ?
    je strlen_loop_end ; If yes, we're done

    inc rax ; Increments the counter
    inc rdi ; Moves to the next character

    jmp strlen_loop ; Recursivity

strlen_loop_end:
    ret
