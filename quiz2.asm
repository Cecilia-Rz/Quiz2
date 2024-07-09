section .data
    a dd 5            ; Initialize a to 5
    b dd 10             ; Initialize b to 10
    c dd 15            ; Initialize c to 15
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
