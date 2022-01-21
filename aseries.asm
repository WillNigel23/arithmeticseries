; Arithmetic Series
; Will Nigel De Jesus

; -----------Usage-------------
; nasm -f elf aseries.asm
; gcc aseries.o -o aseries -m32
; ./aseries

section .text
    extern printf
    extern scanf
    global main

main:
    push ebp
    mov ebp, esp

    ; Intro Message
    push intro_msg
    call printf

    ; New Line
    push line_break
    call printf

    ; Enter first number
    push a0_msg
    call printf

    ; Get input for first number
    add esp, 4
    push a0
    push read_int
    call scanf

    ; New Line
    push line_break
    call printf

    ; Enter common difference
    push d_msg
    call printf

    ; Get input for second number
    add esp, 4
    push d
    push read_int
    call scanf

    ; New Line
    push line_break
    call printf

    ; Enter last number
    push an_msg
    call printf

    ; Get input for last number
    add esp, 4
    push an
    push read_int
    call scanf

    ; New Line
    push line_break
    call printf

    ; Check for Errors
    mov eax, [d]
    cmp eax, 0
    je error    ; 0 Common Difference error

    mov ebx, [a0]
    mov ecx, [an]
    cmp eax, 0
    jl case1    ; Common Difference < 0

    jg case2    ; Common Difference > 0

case1:
    cmp ebx, ecx
    jl error    ; Common Difference < 0 and Starting Number is less than Last Number

    ; If valid, init aseries
    call init_aseries

case2:
    cmp ebx, ecx
    jg error
    
    ; If valid, init aseries
    call init_aseries

error:
    push error_msg
    call printf
    jmp exit

init_aseries:
    ; Intro message
    push intro_msg
    call printf

    ; Initialize Variables
    mov eax, [a0]
    mov ebx, [d]
    mov ecx, [an]
    mov edx, [sum]

    ; Add starting number to initial sum
    add edx, eax

    ; Call aseries function
    call aseries

aseries:
    ; Add common difference to current number
    add eax, ebx

    ; Check if d < 0
    cmp ebx, 0
    jl d_negative

    ; Otherwise, d > 0
    
    ; Check if done
    cmp eax, ecx
    jg aseries_done

    ; If not done, then loop back
    add edx, eax
    jmp aseries

d_negative:
    ; Check if done
    cmp eax, ecx
    jl aseries_done

    ; If not done, then loop back
    add edx, eax
    jmp aseries

aseries_done:
    ; Output the sum
    push edx
    push output_msg
    call printf

exit:
    ; Exit
    mov eax, 1
    mov ebx, 0;
    int 0x80


section .data
    ; Messages
    intro_msg   :   db  "Arithmetic Series", 10, 0
    a0_msg      :   db  "Enter first number: ", 10, 0
    d_msg       :   db  "Enter common difference: ", 10, 0
    an_msg      :   db  "Enter last number: ", 10, 0
    error_msg   :   db  "ERROR. Invalid input, please check variables.", 10, 0
    output_msg  :   db  "Sum = %d", 10, 0

    ; Utils
    print_int   :   db  "%d", 10, 0
    read_int    :   db  "%d", 0
    h_tab       :   db  "", 09
    line_break  :   db  "", 10, 0

    ; Vars
    a0  :   dd  0
    d   :   dd  0
    an  :   dd  0
    sum :   dd  0