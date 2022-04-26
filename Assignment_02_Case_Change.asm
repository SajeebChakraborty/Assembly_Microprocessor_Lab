.MODEL SMALL

.STACK 100H


.DATA

MSG DB 90 DUP (?)

.CODE

MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV SI,0000H 
    MOV DI,0000H
    
     
    ;read the string
    
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
       
       MOV DL,0DH
       INT 21H 
       
       
       
       
    ITERATE:
    
    
        CMP DI,SI
        JZ EXIT2
        
        
        CMP MSG[DI],'A'
        JL LAST
        
        CMP MSG[DI],'Z'
        JG LOWERCHECK
        
        
        ADD MSG[DI],32 
        JMP LAST
        
        
        LOWERCHECK:
        
                CMP MSG[DI],'a'
                JL LAST
                
                CMP MSG[DI],'z'
                JG LAST
                
                SUB MSG[DI],32 
                JMP LAST
                
        
        LAST:   
            
           MOV DL,MSG[DI]
        
           MOV AH,02H
           INT 21H
           INC DI 
           JMP ITERATE
        
        
        
    EXIT2:
    
        MOV AX,4CH
        INT 21H
    
    MAIN ENDP


END MAIN