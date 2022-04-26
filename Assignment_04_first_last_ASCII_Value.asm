.MODEL SMALL

.STACK 100H

.DATA

MSG DB 80 DUP (?)
MIN DB 125
MAX DB 0

.CODE

MAIN PROC  
    
    
    ;lower case sequence first and last ASCII Value
    
    
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
         
         MOV DH,MSG[DI]
         
         CMP MIN,DH
         JG MIN_ASCII
         
         CMP MAX,DH
         JL MAX_ASCII
         
         
         JMP LAST
              
         
         MIN_ASCII:     
         
       
         
               MOV MIN,DH
               INC DI
               JMP ITERATE 
               
          
         MAX_ASCII:     
         
       
         
               MOV MAX,DH
               INC DI
               JMP ITERATE
         
         
         
         LAST: 
         INC DI
         JMP ITERATE
         
            
         
     
    
    EXIT2: 
    
    MOV DL,MIN
    
    MOV AH,02H
    INT 21H 
    
    
    MOV DL,MAX
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP


END MAIN