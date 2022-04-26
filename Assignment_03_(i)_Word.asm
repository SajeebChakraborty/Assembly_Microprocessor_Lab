.MODEL SMALL

.STACK 100H

.DATA

MSG DB 80 DUP (?)
CNT DB '0'


.CODE

MAIN PROC
    
    
    ;count the number of Word
    
    
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
                
         
    
    
    COUNT_WORD: 
    
    
            CMP DI,SI
            JZ EXIT2
    
            CMP MSG[DI],' '
            JE COUNT
            
                   
            INC DI
            JMP COUNT_WORD
            
            
            COUNT: 
                   
                INC CNT
                INC DI
                JMP COUNT_WORD
            
            
            
    
    EXIT2:  
     
    ADD CNT,1
    
    MOV DL,CNT
    
    MOV AH,02H
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP


END MAIN