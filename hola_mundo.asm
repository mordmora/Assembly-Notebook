
;-------------Mord Mora----------------

section .data
  string db "Hola mundo:)",0 ;variable donde va la cadena
  lenVar equ $ - string ;longitud en bytes de la cadena

section .text
global _start
_start:
  
  mov rax, 4  ;llamado a sys_write()
  mov rbx, 1  ;Tipo de salida "en este caso stdout"
  mov rcx, string ;Variable que contiene el string
  mov rdx, lenVar ;longitud de la cadena
  int 0x80 ;system call

  mov rax, 1  ;llamado a sys_exit()
  xor ebx, ebx  ;codigo de estado = 0 (algo xor algo = 0)
  int 0x80 ;system call

