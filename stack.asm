.model small
.stack 100h 
.data
    before DB 'BEFORE REVERSE:$'
    after DB 0DH,0AH,'AFTER REVERSE: $'

.code
     main proc 
         mov ax,@data  ;load data section
         mov ds,ax 
         mov cx, 3  
         
         mov ah, 9
         lea dx, before    
         int 21h
    iter:     
      
         mov ah,1
         int 21h  
         push ax
         
         dec cx
         cmp cx, 0
         je print 
         
         jmp iter
         
     print: 
        cmp cx, 0
        je rev
     
        pop dx
        mov ah, 2
        int 21h  
        
        inc cx
        cmp cx, 3
        je exit 
        jmp print   
        
    rev:
        mov ah, 9
        lea dx, after    
        int 21h  
         
        pop dx
        mov ah, 2
        int 21h  
        
        inc cx
        jmp print
        
    exit:
        mov ah, 4ch
        int 21h
        
    main endp
 end main
    
        
        
        
         





