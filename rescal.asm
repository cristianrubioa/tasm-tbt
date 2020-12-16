
;/////////////////////////////////////////
;AUTOR: CRISTIAN FELIPE RUBIO AGUIAR
;         INGENIERIA ELECTRONICA
;/////////////////////////////////////////


print macro x, y, attrib, sdat
LOCAL   s_dcl, skip_dcl, s_dcl_end
    pusha
    mov dx, cs
    mov es, dx
    mov ah, 13h
    mov al, 1
    mov bh, 0
    mov bl, attrib
    mov cx, offset s_dcl_end - offset s_dcl
    mov dl, x
    mov dh, y
    mov bp, offset s_dcl
    int 10h
    popa
    jmp skip_dcl
    s_dcl DB sdat
    s_dcl_end DB 0
    skip_dcl:
endm

clear_screen macro
    pusha
    mov ax, 0600h
    mov bh, 0000_1111b
    mov cx, 0
    mov dh, 24
    mov dl, 79
    int 10h
    popa
endm

clear2_screen macro
    pusha
    mov ax, 0600h
    mov bh, 1111_0001b
    mov cx, 0
    mov dh, 24
    mov dl, 79
    int 10h
    popa
endm

data segment
  texto DB 64H DUP (?)                ;Variable (texto) de 100 (64H)
data ends

code segment
assume cs:code, ds:data

main proc far
  push ds
  xor ax,ax
  push ax
  mov ax,data                       ;Mueve data a ax
  mov ds,ax                         ;Mueve ...
  lea si,texto                      ;Carga la variable (texto) en si


RESISTOR:
print 1,3,0011_0000b, "                                                                              "
print 1,4,0011_0000b, "              Calculadora de Colores de resistencias V_1.0 alpha              "
print 1,5,0011_0000b, "                                                                              "
print 1,9,0000_1111b,  "              101010  010101                      010101  101010"
print 1,10,0000_1111b, "              101010  010101                      010101  101010"
print 1,11,0000_1111b, "              101010  010101/10101  010101  10101/010101  101010"
print 1,12,0000_1111b, "              101010  010101/10101  010101  10101/010101  101010"
print 1,13,0000_1111b, " //////////// 101010  010101/10101  010101  10101/010101  101010 ////////////"
print 1,14,0000_1111b, " //////////// 101010  010101/10101  010101  10101/010101  101010 ////////////"
print 1,15,0000_1111b, "              101010  010101/10101  010101  10101/010101  101010"
print 1,16,0000_1111b, "              101010  010101/10101  010101  10101/010101  101010"
print 1,17,0000_1111b, "              101010  010101                      010101  101010"
print 1,18,0000_1111b, "              101010  010101                      010101  101010"
print 1,21,0000_1111b, "              Presione una tecla para continuar..."

  mov ah,01h                        ;Lee el caracter de entrada y lo envia a la salida
  int 21h
  clear2_screen
  jmp LOGO



LOGO:
print 8,1,0011_0000b, " Universidad de Ibague"
print 14,4,1111_0001b, "                         0101"
print 14,5,1111_0001b, "                        010101"
print 14,6,1111_0001b, "                       01010101"
print 14,7,1111_0001b, "                       01010101"
print 14,8,1111_0001b, "                        010101"
print 14,9,1111_0001b, "                   101   0101  101"
print 15,10,1111_0001b, "                 10101        10101"
print 15,11,1111_0001b, "               1010101  0101  1010101"
print 15,12,1111_0001b, "              1010101  010101  1010101"
print 15,13,1111_0001b, "             1010101   101010   1010101"
print 15,14,1111_0001b, "            1010101    010101    1010101"
print 15,15,1111_0001b, "           1010101    10101010    1010101"
print 15,16,1111_0001b, "           1010101    01010101    1010101"
print 15,17,1111_0001b, "          1010101    1010101010    1010101"
print 15,18,1111_0001b, "         01010101    1010101010    10101010"
print 15,19,1111_0001b, "         101010101                101010101"
print 15,20,1111_0001b, "         1010101010101010101010101010101010"
print 15,21,1111_0001b, "          101010101010101010101010101010101"
print 15,22,1111_0001b, "            01010101010101010101010101010"
jmp RETARDO

;***************************************************************
;* CX es la palabra de orden superior del conteo. Por ejemplo, *
;* si CX es 98h y DX es 9680h, un retraso de 10 segundos       *
;***************************************************************

RETARDO:
mov ah,86h
mov cx, 10h        ;Tiempo en microsegundos
mov dx, 2030h
int 15h
clear_screen
jmp INICIO


INICIO:
  clear_screen
  print 1,1,1110_0000b, " Valores comerciales de resistencias de cuatro (4) bandas: "
  print 1,2,0000_0000b, " "
  print 1,3,0011_0000b, " a =   1 ohm "
  print 1,4,0011_0000b, " b =  10 ohm "
  print 1,5,0011_0000b, " c =  15 ohm "
  print 1,6,0011_0000b, " d =  22 ohm "
  print 1,7,0011_0000b, " e =  27 ohm "
  print 1,8,0011_0000b, " f =  33 ohm "
  print 1,9,0011_0000b, " g =  39 ohm "
  print 1,10,0011_0000b, " h =  47 ohm "
  print 1,11,0011_0000b, " i =  56 ohm "
  print 1,12,0011_0000b, " j =  68 ohm "
  print 1,13,0011_0000b, " k =  75 ohm "
  print 1,14,0011_0000b, " l =  82 ohm "
  print 1,15,0011_0000b, " m = 100 ohm "
  print 1,16,0011_0000b, " n = 120 ohm "
  print 1,17,0011_0000b, " o = 150 ohm "
  print 1,18,0011_0000b, " p = 180 ohm "
  print 1,19,0011_0000b, " r = 220 ohm "
  print 1,20,0011_0000b, " s = 270 ohm "
  print 1,21,0011_0000b, " t = 330 ohm "
  print 1,22,0011_0000b, " u = 390 ohm "
  print 1,23,0011_0000b, " v = 470 ohm "
  print 1,24,0011_0000b, " w = 510 ohm "
  print 15,2,0000_0000b, " "
  print 15,3,0011_0000b, " x = 680 ohm "
  print 15,4,0011_0000b, " y = 820 ohm "
  print 15,5,0011_0000b, " z =  1K ohm "
  print 15,6,0011_0000b, " A =  3K ohm "
  print 15,7,0011_0000b, " B = 10K ohm "
  print 15,8,0011_0000b, " C = 15K ohm "

  print 63,24,0000_1111b, " @cristianrubio "

  print 15,16,0000_1111b, "* Para saber el codigo de colores del valor"
  print 15,17,0000_1111b, "  Ingrese el caracter."
  print 16,18,0000_1111b, " "

  COMPARADOR:
    mov ah,01h
    int 21h

    cmp al,61h                        ;Se compara con a
    jb COMPARADOR                         ;Si es menor salta a "INICIO"

    cmp al,7ah                        ;Se compara z
    ja COMPARADOR                         ;Si es mayor salta a "INICIO"

    cmp al,0dh                        ;Se compara con enter
    je ETIQUETA                       ;Si es igual salta a "ETIQUETA"

    cmp al,73h
    je SALIR


    cmp al,61h
    je 1_OHM

    cmp al,62h
    je 10_OHM

    cmp al,63h
    je 15_OHM

    cmp al,64h
    je 22_OHM


1_OHM:
  print 46,8,0110_0000b, " marron "
  print 46,9,0000_1111b, " negro  "
  print 46,10,1110_0000b, " dorado "
  print 46,11,1110_0000b, " dorado "
  print 16,18,0000_1111b, " "
  mov ah,01h
  int 21h
  cmp al,73h
  je SALIR

10_OHM:
 print 46,8,0110_0000b, " marron "
 print 46,9,0000_1111b, " negro  "
 print 46,10,0000_1111b, " negro  "
 print 46,11,1110_0000b, " dorado "
 print 16,18,0000_1111b, " "
 mov ah,01h
 int 21h
 cmp al,73h
 je SALIR

15_OHM:
  print 46,8,0110_0000b, " marron "
  print 46,9,0010_0000b, " verde  "
  print 46,10,0000_1111b, " negro  "
  print 46,11,1110_0000b, " dorado "
  print 16,18,0000_1111b, " "
  mov ah,01h
  int 21h
  cmp al,73h
  je SALIR

22_OHM:
  print 46,8,0100_0000b, "  rojo  "
  print 46,9,0100_0000b, "  rojo  "
  print 46,10,0000_1111b, "  negro  "
  print 46,11,1110_0000b, " dorado "
  print 16,18,0000_1111b, " "
  mov ah,01h
  int 21h
  cmp al,73h
  je SALIR

27_OHM:
  print 46,8,0100_0000b, "  rojo  "
  print 46,9,0101_0000b, "violeta "
  print 46,10,0000_1111b, "  negro  "
  print 46,11,1110_0000b, " dorado "
  print 16,18,0000_1111b, " "
  mov ah,01h
  int 21h
  cmp al,73h
  je SALIR

33_OHM:
  print 46,8,1100_0000b, " naranja"
  print 46,9,1100_0000b, " naranja"
  print 46,10,0000_1111b, "  negro  "
  print 46,11,1110_0000b, " dorado "
  print 16,18,0000_1111b, " "
  mov ah,01h
  int 21h
  cmp al,73h
  je SALIR

39_OHM:
  print 46,8,1100_0000b, " naranja"
  print 46,9,1111_0000b, " blanco "
  print 46,10,0000_1111b, "  negro  "
  print 46,11,1110_0000b, " dorado "
  print 16,18,0000_1111b, " "
  mov ah,01h
  int 21h
  cmp al,73h
  je SALIR




ETIQUETA:
  cmp si,00                        ;Se compara si con zero para saber "Si esta vacia"
  je COMPARADOR                        ;Si es igual a zero salta a la "INICIO"

                                     ;"Si no esta vacia (basura)"
  mov al,'$'                       ;Se asigna el caracter del fin de la cadena a "al"


VISUALIZAR:
  mov ah,09h                       ;Visualizo la cadena de caracteres en mayusculas
  lea dx,texto                     ;dx=segmento
  int 21h


SALIR:
clear_screen
print 29,10,1110_0000b, "Abandonar el programa"
print 5,13,0000_1111b, " Presione (s) para confirmar y/o (n) para cancelar: "

mov ah,01h
int 21h

cmp al,73h
je LOGOFIN

cmp al,6eh
je INICIO

LOGOFIN:
clear_screen
print 15,5,0000_0000b, "     010101101010101       010101010101"
print 15,6,0000_1111b, "     010101101010101       01010101010101"
print 15,7,0000_1111b, "     010101101010101       010101010101010"
print 15,8,0000_1111b, "     010101101010101       01010      0101"
print 15,9,0000_1111b, "     010101                01010       0101"
print 16,10,0000_1111b, "    010101                01010      0101"
print 16,11,0000_1111b, "    010101                01010101010101"
print 16,12,0000_1111b, "    010101                0101010101010"
print 16,13,0000_1111b, "    010101                01010101010"
print 16,14,0000_1111b, "    010101                01010  0101010"
print 16,15,0000_1111b, "    010101                01010    101010"
print 16,16,0000_1111b, "    010101101010101       01010      101010"
print 16,17,0000_1111b, "    010101101010101       01010        101010"
print 16,18,0000_1111b, "    010101101010101       01010         101010"

FIN:
      mov ah,07h
	    int 21h
      mov ah,4ch
      int 21h
      main endp
      code ends
      end main
      end
