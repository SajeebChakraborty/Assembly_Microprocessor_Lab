.MODEL SMALL

.STACK 100H

.DATA

MSG DB 80 DUP (?)

.CODE

MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX 
    
    
    MOV SI,0000H
    MOV DI,0000H
    
    ;scan the string
    
    MOV AH,01H
    
    SCAN:
        
       INT 21H
       CMP AL,0DH
       JZ EXIT
       
       
       MOV MSG[SI],AL
       INC SI
       JMP SCAN
       
       
    EXIT:
    
       
       MOV AH,02H
       MOV DL,0AH
       INT 21H
       
      
       
     
      
    REVERSE:
    
        CMP SI,DI
        JZ EXIT2
        
        MOV DL,MSG[SI-1]
        MOV AH,02H
        INT 21H
        
        DEC SI
        JMP REVERSE  
    
     
     
    EXIT2: 
    
    MOV AH,4CH
    INT 21H    
    
    MAIN ENDP


END MAIN