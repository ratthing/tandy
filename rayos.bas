    1 "="USING : INPUT"PC2$ ";Z$ : GOTO Z$
    2 END
    3 "LS"
    4 WAIT : PRINT "TIME/2DATES/ENC/DEC"
    9 GOTO 1
   10 "TIME"
   11 PE=7 : Y=TIME : Y$=STR$ Y : Y1$=MID$(Y$,6,1)
   12 IF Y1$="." THEN LET PE=6
   13 MO$=LEFT$(Y$,2) 
   14 IF PE=6 THEN LET MO$=LEFT$(Y$,1)
   15 HH$=MID$(Y$,PE-2,2) : MM$=MID$(Y$,PE+1,2) : DD$=MID$(Y$,PE-4,2)
   16 TD$=HH$+":"+MM$+" "+MO$+"/"+DD$
   17 WAIT : BEEP 2 : PRINT TD$ : CLEAR
   18 GOTO 1
   50 "2DATES" INPUT"1ST DATE M1?",M,"D1?",D,"Y1?",Y : GOSUB "DJ"
   60 A=J : INPUT"2ND DATE M2?",M,"D2?",D,"Y2?",Y : GOSUB "DJ" : GOTO 90
   70 INPUT"# DAYS FROM DATE?",N : J=J+N : GOSUB "JD"
   80 PRINT"NEW M.D.Y.=";M;D;Y : CLEAR : GOTO 1
   90 PRINT J-A;"DAYS BETWEEN" : CLEAR : GOTO 1
  100 "ENC" INPUT "KEY:";K$: IF LEN K$<>16 THEN GOTO 100
  110 INPUT "MSG:";M$: IF LEN M$>16 THEN GOTO 110
  120 L=LEN M$: O$=""
  130 FOR I=1 TO L: R1$=MID$(M$,I,1): R2$=MID$(K$,I,1)
  135 T=ASC(R1$)-64: U=ASC(R2$)-64: TU=T+U
  140 IF TU>26 THEN LET TU=TU-26
  150 O$=O$+CHR$(TU+64): NEXT I
  160 WAIT: PRINT O$
  165 GOTO 1
  170 "DEC" INPUT "KEY:";K$: IF LEN K$<>16 THEN GOTO 170
  180 INPUT "MSG:";M$: IF LEN M$>16 THEN GOTO 180
  190 L=LEN M$: O$=""
  200 FOR I=1 TO L:R1$=MID$(M$,I,1): R2$=MID$(K$,I,1)
  205 T=ASC(R1$)-64: U=ASC(R2$)-64: TU=T-U
  210 IF TU<0 THEN LET TU=TU+26
  220 O$=O$+CHR$(TU+64): NEXT I
  230 WAIT: PRINT O$
  235 GOTO 1
  900 "DJ"J=INT(365.2422*Y+30.44*(M-1)+D+1) : N=M-2+12*(M<3)
  905 Z=Y-(M<3) : E=INT (Z/100) : Z=Z-100E
  910 W=INT(2.61*N-.2)+D+Z+INT(Z/4)+INT(E/4)-2E
  915 W=W-7*INT(W/7) : X=J-7*INT(J/7)
  920 J=J-X+W-7*(X<W)+1721061 : RETURN
  950 "JD"G=J : Y=INT((J-1721061)/365.25+1) : M=1 : D=1 
  955 GOSUB "DJ" : IF J>G THEN LET Y=Y-1 : GOTO 955
  960 M=INT((G-J)/29+1)
  965 GOSUB "DJ" : IF J>G THEN LET M=M-1 : GOTO 965
  970 D=G-J+1 : GOTO "DJ"