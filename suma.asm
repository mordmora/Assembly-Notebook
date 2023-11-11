sys_read equ 3
sys_write equ 4
sys_exit equ 1
stdout equ 1
stdin equ 2

;todo:
;asignar numeros a las variables num1 y num2
;realizar la operacion

section .data 

  msg1 dd "Ingresa un numero ",10
  msg2 dd "Ingresa otro numero ",10
  msg3 dd "Resultado "
  len_msg1 equ $ - msg1
  len_msg2 equ $ - msg2
  len_msg3 equ $ - msg3

  result dd 0,10
;  out dd 0,10

  ;len equ $ - out

section .bss
  num1 resb 4
  num2 resb 4

section .text

  global _start
  _start:
  
  mov eax, sys_write
  mov ebx, stdout
  mov ecx, msg1
  mov edx, len_msg1
  int 0x80

  mov eax, sys_read
  mov ebx, stdin
  mov ecx, num1
  mov edx, 5
  int 0x80

  mov eax, sys_write
  mov ebx, stdout
  mov ecx, msg2
  mov edx, len_msg2
  int 0x80

  mov eax, sys_read
  mov ebx, stdin
  mov ecx, num2
  mov edx, 5
  int 0x80


  mov eax, 1
  xor ebx, ebx
  int 0x80

  
