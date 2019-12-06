
/*------------------------------------------------------------------------
    File        : day2-part1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Dec 05 20:44:38 CET 2019
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

DEFINE VARIABLE cCommands AS LONGCHAR NO-UNDO.
DEFINE VARIABLE iStep     AS INTEGER  NO-UNDO.
DEFINE VARIABLE iOut      AS INTEGER NO-UNDO.
DEFINE VARIABLE iIn       AS INTEGER NO-UNDO EXTENT 2.
COPY-LOB FROM FILE "jensdahlin-progressabl/day2.txt" TO cCommands.

cCommands = "1,0,0,0,99,,,,,,,,,,,,,,,,".

//DISPLAY STRING(cCommands).
computing:
DO iStep = 1 TO NUM-ENTRIES(cCommands) BY  4:
    iOut   = INTEGER(ENTRY(iStep + 3, cCommands)) + 1.
    iIn[1] = INTEGER(ENTRY(iStep + 1, cCommands)) + 1.
    iIn[2] = INTEGER(ENTRY(iStep + 2, cCommands)) + 1.
    
    CASE ENTRY(iStep, cCommands) :
        WHEN "1" THEN DO:
            ENTRY(iOut, cCommands) = STRING(INTEGER(ENTRY(iIn[1], cCommands)) + INTEGER(ENTRY(iIn[1], cCommands))).
        END.
        WHEN "2" THEN DO:
            ENTRY(iOut, cCommands) = STRING(INTEGER(ENTRY(iIn[1], cCommands)) * INTEGER(ENTRY(iIn[1], cCommands))).
        END.
        WHEN "99" THEN DO:
            LEAVE computing.
        END.
        OTHERWISE DO:
            RETURN ERROR "An error occured".
        END.
    END CASE. 
    MESSAGE STRING(cCommands) VIEW-AS ALERT-BOX.
END.

MESSAGE STRING(cCommands) VIEW-AS ALERT-BOX.
MESSAGE STRING(ENTRY(1, cCommands)) VIEW-AS ALERT-BOX.