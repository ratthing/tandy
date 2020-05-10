   10 RANDOM 
   20 C=0:R=RND 9999
   25 P1$="Guess ":P2$=""
   30 E=0: CLS : WAIT 0: PRINT P2$;P1$;: INPUT G
   35 C=C+1
   40 IF G<R THEN LET E=1
   50 IF G>R THEN LET E=2
   60 IF G=R THEN LET E=3
   70 ON E GOTO 80,100,120
   80 P2$="Too low! "
   90 GOTO 30
  100 P2$="Too high! "
  110 GOTO 30
  120 WAIT : CLS : PRINT "CORRECT! ";C;" GUESSES"
  199 END
