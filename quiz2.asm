section .data
    a dd 10            ; Initialize a to 10
    b dd 5             ; Initialize b to 5
    c dd 20            ; Initialize c to 20
    d dd 2             ; Initialize d to 2

section .bss
    result resd 1      ; Uninitialized variable for storing the result

section .text
    global _start

_start:
    ; Calculate a * b
    mov eax, [a]       ; Load a into eax
    imul eax, [b]      ; Multiply eax by b (eax = a * b)
    mov ebx, eax       ; Store the result of a * b in ebx

    ; Calculate c * d
    mov eax, [c]       ; Load c into eax
    imul eax, [d]      ; Multiply eax by d (eax = c * d)

    ; Add (a * b) and (c * d)
    add eax, ebx       ; Add ebx (a * b) to eax (c * d)

    ; Store the result in the result variable
    mov [result], eax  ; Store the final result

    ; Exit the program
    mov eax, 1         ; syscall number for exit
    xor ebx, ebx       ; exit code 0
    int 0x80           ; make the syscall
