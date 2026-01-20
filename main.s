.intel_syntax noprefix
.globl main

.section .text
main:
  push rbp
  mov rbp, rsp
  sub rsp, 16
  
  sub rsp, 32 
  
  //arquivo de entrada
  mov r10, [rsi + 8]
  mov [rbp - 8], r10
  
  //arquivo de saida
  mov r10, [rsi + 16]
  mov [rbp - 16], r10

  //ref para arquivo de entrada
  mov rdi, [rbp - 8]
  lea rsi, [rip + read_format]
  call fopen@plt
  mov [rbp - 8], rax
  
  //ref para arquivo de saida
  mov rdi, [rbp - 16]
  lea rsi, [rip + create_write]
  call fopen@plt
  mov [rbp - 16], rax
  
  mov rdi, [rbp - 8]
  lea rsi, [rip + number_format]
  xor eax, eax
  lea rdx, [rbp - 24]
  call fscanf@plt

  lea rdi, [rip + number_format]
  mov rsi, [rbp - 24]
  xor eax, eax
  call printf@plt

  leave 
  ret

.section .data
create_write: .asciz "w+"
read_format: .asciz "r"
number_format: .asciz "%d"
char_format: .asciz "%c"
quantity: .int 10

