   10 CLEAR : DIM S$(64)*22:CO=0
   20 BEEP 1: INPUT "E,V,S > ";I$
   30 IF I$="E" THEN GOTO 100
   40 IF I$="V" THEN GOTO 150
   50 IF I$="S" THEN GOTO 200
   80 GOTO 20
  100 CO=CO+1
  105 IF CO>30 THEN GOTO 20
  110 INPUT ">";S$(CO)
  130 GOTO 20
  150 FOR I=1 TO CO
  160 WAIT : PRINT I;":";S$(I)
  170 NEXT I
  180 GOTO 20
  200 INPUT "START REC THEN <ENTER>";E$
  210 PRINT #"TEXTDAT";S$(*)
  220 GOTO 20
