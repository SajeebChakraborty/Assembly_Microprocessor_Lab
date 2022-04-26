.MODEL SMALL

.STACK 100H

.DATA

MSG DB 80 DUP (?)
LONGEST DB '0'

.CODE

MAIN PROC  
    
    
    ;longest lower case sequence
    
    
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
       
       
    MOV DL,'0'
    
     
    ITERATE:
        
         CMP DI,SI
         JZ EXIT2
         
         CMP MSG[DI],'a'
         JL LAST
         
         CMP MSG[DI],'z'
         JG LAST
         
         INC DL
         
         CMP LONGEST,DL
         JL FIND_OUT
         INC DI
         JMP ITERATE 
         
         
         
         
         
         
         FIND_OUT:     
         
       
         
               MOV LONGEST,DL
               INC DI
               JMP ITERATE
         
         
         
         LAST: 
         MOV DL,'0'
         INC DI
         JMP ITERATE
         
            
         
     
    
    EXIT2: 
    
    MOV DL,LONGEST
    
    MOV AH,02H
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP


END MAIN