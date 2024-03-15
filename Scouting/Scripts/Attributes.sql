/********************************************************************************
Description.. :	

Parameters... :	- 

Returns...... :	- 

Author....... :	SYSADM
Date......... : 2024-02-26
********************************************************************************
_______________________________________________________________________________

Modification. : 
Author....... :	
Date......... :	
_______________________________________________________________________________
********************************************************************************/;



:PROCEDURE Add;
	:PARAMETERS attributes;
:DECLARE nAttributeId;
nAttributeId := LIMSSetCounter("NL_ATTRIBUTE","ATTRIBUTE_ID","",{"No Insert"},{});
	
RunSQL("insert into NL_ATTRIBUTE (ATTRIBUTE_ID, PLAYER_ID, POSITION, CLUB)
values (?, ?, ?, ?)",,{nAttributeId, attributes:Player_Id, attributes:Position, attributes:Club });
:RETURN nAttributeId;
:ENDPROC;

:PROCEDURE UpdateAttr;
	:PARAMETERS Player_Id, UpdateAttributes;
	RunSql("update NL_ATTRIBUTE set  POSITION = ?, CLUB = ? where Player_ID = ?",, { UpdateAttributes:Position, UpdateAttributes:Club, Player_Id});
:ENDPROC;
