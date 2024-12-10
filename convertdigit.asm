.MODEL SMALL
.STACK 100H
.DATA 
inp db "Input the number : $";
outp db "This is your number : $";
newl db 0dh,0ah,"$";
di1 db ?,'$';
di2 db ?,'$';

.CODE
MAIN PROC
    MOV ax,@DATA;load data
    MOV ds,ax;
    
    MOV ah,9;    print message "Input the number :"
    LEA dx,inp;
    INT 21h;
    
    MOV ah,1;    take first digit input 
    INT 21h;
    SUB al,'0';   conversion from ascii to real value
    MOV di1,al;
    
    MOV ah,1;    take second digit input
    INT 21h;
    SUB al,'0';  conversion from ascii to real value
    MOV di2,al;
    
    MOV ah,9;    print new line
    LEA dx,newl;
    INT 21h;
    
    MOV ah,9;    print message "This is your number :"
    LEA dx,outp;
    INT 21h;  
    
    MOV ah,9;    print first digit 
    ADD di1,'0';  conversion from real value to ascii value
    LEA dx,di1;
    INT 21h; 
    
    MOV ah,9;    print second digit 
    ADD di2,'0'; conversion from real value to ascii value
    LEA dx,di2;
    INT 21h;
    
    
    MOV ah,4ch; dos exit
    INT 21h;
    

    MAIN ENDP
END MAIN
