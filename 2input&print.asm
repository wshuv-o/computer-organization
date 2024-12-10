.MODEL SMALL
.STACK 100h
.DATA
msg1 db "Please enter two digits : $"
msg2 db ",$";
msg3 db "The two digits entered was $"
msg4 db 0dh,0ah,"$";
.CODE
MAIN PROc
    MOV ax,@DATA
    MOV ds,ax;
    
    MOV ah,9;
    lea dx,msg1;
    int 21h;
    
    mov ah,1;
    int 21h
    mov bl,al;
    
    mov ah,1;
    int 21h;
    mov cl,al;
    
    mov ah,9;
    lea dx,msg4;
    int 21h
    
    mov ah,9;
    lea dx,msg3;
    int 21h;
    
    mov ah,2;
    mov dl,bl;
    int 21h;
    
    mov ah,9;
    lea dx,msg2;
    int 21h;
    
    mov ah,2;
    mov dl,cl;
    int 21h;
    
    mov ah,4ch;
    int 21h;
    
    main endp
end main
    
    