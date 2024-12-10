.MODEL SMALL
.STACK 100H
.DATA
MSG1 db " ENTER THE THREE INITIALS : $"; 
nl db 0dh,0ah ,'$';

.CODE
main proc
    
    mov ax,@data;
    mov ds,ax;
    
    mov ah,9; 
    lea dx,MSG1;
    int 21h; 
    
    mov ah,1;
    int 21h;
    mov bl,al;
    
    mov ah,1;
    int 21h;
    mov bh,al;
    
    mov ah,1;
    mov cl,al;
    int 21h;  
    
    mov ah,9;
    lea dx,nl;
    int 21h;
    
    mov ah,2;
    mov dl,bl;
    int 21h; 
    
    mov ah,9;
    lea dx,nl;
    int 21h; 
    
    mov ah,2;
    mov dl,bh;
    int 21h;
             
             
    mov ah,9;
    lea dx,nl;
    int 21h;
    
    mov ah,2;
    mov dl,cl;
    int 21h;


    mov ah,4ch
    int 21h;
    
    main endp
end
