
/*------------------------------------------------------------------------
    File        : day1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Dec 05 20:24:30 CET 2019
    Notes       :
  ----------------------------------------------------------------------*/

FUNCTION fuel RETURN INTEGER (INPUT piMass AS INTEGER):
     
    RETURN INTEGER(TRUNCATE(piMass / 3,0) - 2).
END.

DEFINE VARIABLE iTotal AS INTEGER NO-UNDO.
DEFINE VARIABLE iMass  AS INTEGER NO-UNDO.

INPUT FROM VALUE("jensdahlin-progressabl/day1.txt").
REPEAT :
    IMPORT iMass.
    iTotal = iTotal + fuel(iMass).
    
END.
INPUT CLOSE. 
    
MESSAGE iTotal VIEW-AS ALERT-BOX.   