; LAB WORK 3 ( MARUT EX# 1)
;Write a program that prompts the user to enter a character, and
;on subsequent lines prints its ASCII code in binary, and the number
;of 1 bits In Its ASCII code.
;Sample execution:
;TYPE A CHARACTER: A
;THE ASCII CODE OF A IN BINARY IS 01000001
;THE NUMBER OF l BITS IS 2
.model small
.stack 100h 
.data
    msg1 DB 0DH,0AH, 'TYPE A CHARACTER:$'
    msg2 DB 0DH,0AH,'THE ASCII CODE OF $'
    msg3 DB ' IN BINARY IS $'
    msg4 DB 0DH,0AH,'THE NUMBER OF 1 BITS IS $'   
    msg5 DB 0DH,0AH,'The input character is not a letter! $'

.code
     main proc 
         mov ax,@data  ;load data section
         mov ds,ax   
    iter:     
         lea dx,msg1   ;print the first message
         mov ah,9
         int 21h 
         
         mov ah,1      ;take the input
         int 21h
         
         xor bx,bx     ;reset the bs register
         mov bl,al     ;mov al to bl 
                  
         cmp bl, 'A'
         jl notletter2
         cmp bl, 'Z'
         jg notletter

   letter: 
         lea dx,msg2   ;print the 2nd number
         mov ah,9
         int 21h
         
         mov dl,bl     ;print the character
         mov ah,2
         int 21h
         
         lea dx,msg3   ;print 3rd message
         mov ah,9
         int 21h   
         
         mov cx,8      ; limit for loop i<=8 for 8 bit 
         mov bh,0      ; makes bh 0    
         
   binary: 
         shl bl,1      ; shift left with 1
         jnc zero      ; if CF=0, then jump to zero flag 
                 ; increament bh
         mov dl,31h    ; mov 1 to dl and go to display flag to print it
         jmp display 
         
     zero: 
         mov dl,30h    ;if come to this flag make dl value 0 (30h)
         inc bh
  display:
         mov ah,2      ; then, print
         int 21h     
         
         loop binary   ;loop will be terminated while cx>8 
         ADD bh,30h 
         lea dx,msg4
         mov ah,9
         int 21h    
         
         mov dl,bh
         mov ah,2
         int 21h     
         
         jmp iter      ; iterate the proccess
notletter:
         cmp al, 'a'
         jl notletter2
         cmp al, 'z'
         jg notletter2
         jmp letter              
           
notletter2:     
         lea dx,msg5   ;print 3rd message
         mov ah,9
         int 21h  
           
         jmp iter
