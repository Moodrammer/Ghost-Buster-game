PUBLIC HOST_SEND_GHOST_DATA
PUBLIC GUEST_RECEIVE_GHOST_DATA
PUBLIC SEND_A_FLAG
PUBLIC RECEIVE_A_FLAG
PUBLIC TESTCON

EXTRN STARTPOS_X_GHOST1 : WORD
EXTRN STARTPOS_Y_GHOST1: WORD
EXTRN TYPE_GHOST1: WORD
EXTRN MOTION_GHOST1: WORD
EXTRN POWERUP_GHOST1: WORD
EXTRN EXISTS_GHOST1: WORD

EXTRN STARTPOS_X_GHOST2 : WORD
EXTRN STARTPOS_Y_GHOST2: WORD
EXTRN TYPE_GHOST2: WORD
EXTRN MOTION_GHOST2: WORD
EXTRN POWERUP_GHOST2: WORD
EXTRN EXISTS_GHOST2: WORD

EXTRN STARTPOS_X_GHOST3 : WORD
EXTRN STARTPOS_Y_GHOST3: WORD
EXTRN TYPE_GHOST3: WORD
EXTRN MOTION_GHOST3: WORD
EXTRN POWERUP_GHOST3: WORD
EXTRN EXISTS_GHOST3: WORD

EXTRN SEND_DATA : FAR
EXTRN SEND_WORD_DATA: FAR
EXTRN RECEIVE_WORD: FAR
EXTRN RECIEVE: FAR


EXTRN RECEIVE_WORD_VALUE: WORD
EXTRN SEND_WORD_VALUE: WORD
EXTRN RECEIVE_VALUE: BYTE
EXTRN SEND_VALUE: BYTE

.MODEL LARGE

CDSEG_2 SEGMENT PARA 'CODE'
;------------------------------------------------------------------------------------
;SENDING GHOST DATA FROM THE HOST TO THE GUEST
;------------------------------------------------------------------------------------
MAIN2 PROC FAR
MAIN2 ENDP
HOST_SEND_GHOST_DATA PROC FAR
ASSUME CS:CDSEG_2

;{SEND GHOST 1 DATA [POSTION:X,Y  MOTIONTYPE  GHOSTMODELTYPE  GHOSTASSOCIATEDPOWERUP GHOSTSTATUS
   MOV AX, STARTPOS_X_GHOST1
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, STARTPOS_Y_GHOST1
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, MOTION_GHOST1
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, TYPE_GHOST1
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, POWERUP_GHOST1
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, EXISTS_GHOST1
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG
   ;-------------------------------------------------------------------------------------------------------
   ;SEND GHOST 2 DATA [POSTION:X,Y  MOTIONTYPE  GHOSTMODELTYPE  GHOSTASSOCIATEDPOWERUP GHOSTSTATUS
   MOV AX, STARTPOS_X_GHOST2
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, STARTPOS_Y_GHOST2
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, MOTION_GHOST2
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, TYPE_GHOST2
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, POWERUP_GHOST2
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, EXISTS_GHOST2
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG
   ;-----------------------------------------------------------------------------------------------
   ;SEND GHOST 3 DATA [POSTION:X,Y  MOTIONTYPE  GHOSTMODELTYPE  GHOSTASSOCIATEDPOWERUP GHOSTSTATUS
   MOV AX, STARTPOS_X_GHOST3
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, STARTPOS_Y_GHOST3
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, MOTION_GHOST3
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, TYPE_GHOST3
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, POWERUP_GHOST3
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   ;CALL RECEIVE_A_FLAG

   MOV AX, EXISTS_GHOST3
   MOV SEND_WORD_VALUE, AX
   CALL SEND_WORD_DATA
   ;CONFIRM GUEST RECIEVED THE VALUE
   CALL RECEIVE_A_FLAG
;}   
RETF
HOST_SEND_GHOST_DATA ENDP
; -------------------------------------------------------------------------------------------------
; RECEIVING THE GHOST DATA GUEST FROM HOST
; -------------------------------------------------------------------------------------------------
GUEST_RECEIVE_GHOST_DATA PROC FAR
ASSUME CS:CDSEG_2
;{RECEIVE GHOST 1 DATA [POSTION:X,Y  MOTIONTYPE  GHOSTMODELTYPE  GHOSTASSOCIATEDPOWERUP GHOSTSTATUS
   ;RECEIVE THE DATA
   CALL RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG   
   
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV STARTPOS_X_GHOST1, AX

   ;RECEIVE THE DATA
   CALL RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV STARTPOS_Y_GHOST1, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV MOTION_GHOST1, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV TYPE_GHOST1, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV POWERUP_GHOST1, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
  ; CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV EXISTS_GHOST1, AX
   ;-------------------------------------------------------------------------------------------------------
   ;RECEIVE GHOST 2 DATA [POSTION:X,Y  MOTIONTYPE  GHOSTMODELTYPE  GHOSTASSOCIATEDPOWERUP GHOSTSTATUS
   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV STARTPOS_X_GHOST2, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV STARTPOS_Y_GHOST2, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV MOTION_GHOST2, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV TYPE_GHOST2, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV POWERUP_GHOST2, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV EXISTS_GHOST2, AX
   ;-----------------------------------------------------------------------------------------------
   ;RECEIVE GHOST 3 DATA [POSTION:X,Y  MOTIONTYPE  GHOSTMODELTYPE  GHOSTASSOCIATEDPOWERUP GHOSTSTATUS
   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV STARTPOS_X_GHOST3, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV STARTPOS_Y_GHOST3, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV MOTION_GHOST3, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV TYPE_GHOST3, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   ;CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV POWERUP_GHOST3, AX

   ;RECEIVE THE DATA
   CALL  RECEIVE_WORD
   ;CONFIRM RECIEVING THE VALUE FROM THE HOST
   CALL SEND_A_FLAG
   ;UPDATE INFO WITH THE RECEIVED DATA
   MOV AX, RECEIVE_WORD_VALUE
   MOV EXISTS_GHOST3, AX
;}   
RETF
GUEST_RECEIVE_GHOST_DATA ENDP
;---------------------------------------------------------------------------
;SENDS [A] FLAG TO CONFIRM THE USER HAS RECIEVED DATA
;---------------------------------------------------------------------------
SEND_A_FLAG PROC FAR
   ASSUME CS:CDSEG_2
   MOV  SEND_VALUE,'A'
   CALL SEND_DATA
RETF
SEND_A_FLAG ENDP
;----------------------------------------------------------------------------
;RECIEVE THE SENT [A] FLAG TO CONFIRM THE OTHER USER RECIEVED THE GIVEN DATA
;----------------------------------------------------------------------------
RECEIVE_A_FLAG PROC FAR
   ASSUME CS:CDSEG_2
   WAIT_REC:
   CALL RECEIVE
   CMP RECEIVE_VALUE, 'A'
   JNZ WAIT_REC
RETF   
RECEIVE_A_FLAG ENDP

TESTCON PROC FAR
    ASSUME CS:CDSEG_2
    MOV AL,13H
    MOV AH,0
    INT 10H
RETF
TESTCON ENDP

CDSEG_2 ENDS

END MAIN2
