
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
    
    DEFINE VARIABLE iFuelTotal AS INTEGER NO-UNDO.
    DEFINE VARIABLE iFuel      AS INTEGER NO-UNDO.
    DEFINE VARIABLE iMass      AS INTEGER NO-UNDO.
    
    iMass = piMass.
    REPEAT :
        iFuel = INTEGER(TRUNCATE(iMass / 3,0) - 2).
        IF iFuel <= 0 THEN LEAVE.
        
        iFuelTotal = iFuelTotal + iFuel.
        iMass = iFuel.
    END.
    RETURN iFuelTotal.
END.

DEFINE VARIABLE iTotal AS INTEGER NO-UNDO.
DEFINE VARIABLE iMass  AS INTEGER NO-UNDO.


INPUT FROM VALUE("jensdahlin-progressabl/day1.txt").
REPEAT :
    IMPORT iMass.
    iTotal = iTotal + fuel(iMass).
END.
INPUT CLOSE. 

MESSAGE iTOtal VIEW-AS ALERT-BOX.   