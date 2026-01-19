.intel_syntax noprefix
.globl main

.section .text
main:
  push rbp
  mov rbp, rsp
  sub rsp, 16
  
  sub rsp, 32 
  
  
  mov rdi, [rsi + 8]
  lea rsi, [rip + read_format]
  call fopen@plt
  mov [rbp - 8], rax
  
  mov rdi, [rsi + 16]
  lea rsi, [rip + create_write]
  call fopen@plt
  mov [rbp - 16], rax
  
  mov rdi, [rbp - 8]
  lea rsi, [rip + number_format]
  xor eax, eax
  call fscanf@plt



  lea rdi, [rip + number_format]
  mov rsi, rax
  xor eax, eax
  call printf@plt

  leave 
  ret

.section .data
create_write: .asciz "w+"
read_format: .asciz "r"
number_format: .asciz "%d"
char_format: .asciz "%c"

