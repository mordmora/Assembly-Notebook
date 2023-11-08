; Escaner sencillo de puertos 
;------------Mord Mora--------------
;H A C K T H E P L A N E T

section .bss
    buffer resb 65535  ; bufer para guardar la respuesta

section .data
    host db "142.250.78.142",0  ; Target: ip de google de ejemplo
    port db "0",0        ; puerto destino

section .text
global _start

_start:
    ; Socket            Protocolos
    mov rax, 41         ; sys_socket
    mov rdi, 2          ; AF_INET (IPv4)
    mov rsi, 1          ; SOCK_STREAM (TCP)
    mov rdx, 0          ; Protocolo (0 para IP)
    syscall

    ; Direccion del servidor
    mov rdi, rax        ; Descriptor de archivo del socket
    mov rax, 42         ; sys_connect
    lea rsi, [host]     ; Pointer a dirección IP
    mov rdx, 2          ; Tamaño de sockaddr_in
    syscall

    ; Es equivalente a un if, verifica que la conexion fue exitosa
    cmp rax, -1
    je .failed

    ; si la conexion fue existosa entoces el puerto está abierto
    mov rax, 1          ; sys_write
    mov rdi, 1          ; Descriptor de archivo estándar (salida)
    lea rsi, [port]
    mov rdx, 2
    syscall

    jmp .close_socket

.failed:
    ; La conexión no fue exitosa, el puerto está cerrado

.close_socket:
    ; Cierra el socket
    mov rax, 3          ; sys_close
    syscall

    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; Código de salida 0
    syscall

