stacksg segment para STACK 'stack'

stacksg ends

data segment
  texto DB 64H DUP (?)                ;Variable (texto) de 100 (64H)
data ends

code segment
assume cs:code, ds:data, ss:stacksg
main proc far

START:
push ds
xor ax,ax
push ax
  mov ax,data                       ;Mueve data a ax
  mov ds,ax                         ;Mueve ...

  lea si,texto                      ;Carga la variable (texto) en si

INICIO:
  mov ah,01h                        ;Lee el caracter de entrada y lo envia a la salida
  int 21h

  cmp al,0dh                        ;Se compara con enter
  je ETIQUETA                       ;Si es igual salta a "ETIQUETA"

  cmp al,20h                        ;Se compara con espacio
  je ESPACIO                        ;Se es igual salta a "ESPACIO"


;    ** 61h y 7ah (Rango de minusculas) **

  cmp al,61h                        ;Se compara con a
  jb INICIO                         ;Si es menor salta a "INICIO"

  cmp al,7ah                        ;Se compara z
  ja INICIO                         ;Si es mayor salta a "INICIO"

  sub al,20h                        ;Se resta 20h al caracter almacenado en "al"
  mov [si],al                       ;Se mueve a "al" a la primera posicion de si
  inc si                            ;Se incrementa 'SI'
  jmp INICIO                        ;Se regresa a "INICIO" hasta que presione enter


ESPACIO:
  inc si                            ;Si se presiona Espacio aumente "si" y salte a "INICIO"
  jmp INICIO


ETIQUETA:
  cmp si,00                        ;Se compara si con zero para saber "Si esta vacia"
  je INICIO                        ;Si es igual a zero salta a la "INICIO"

                                   ;"Si no esta vacia (basura)"
  inc si                           ;Incrementa "si"
  mov al,'$'                       ;Se asigna el caracter del fin de la cadena a "al"
  mov [si],al                      ;Se mueve a "[si]"

VISUALIZAR:
  mov ah,09h                       ;Visualizo la cadena de caracteres en mayusculas
  lea dx,texto                     ;dx=segmento
  int 21h


FIN:
  mov ah,07h
  int 21h
  mov ah,4ch
  int 21h
  main endp
  code ends
  end main
  end
