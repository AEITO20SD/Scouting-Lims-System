/********************************************************************************
Description.. :	

Parameters... :	- 

Returns...... :	- 

Author....... :	SYSADM
Date......... : 2024-03-11
********************************************************************************
_______________________________________________________________________________

Modification. : 
Author....... :	
Date......... :	
_______________________________________________________________________________
********************************************************************************/;

/*RunSQL("insert into NL_POSITION (PLAYER_ID ,PLAYER_POSITION ,POSITION_ID) values (?, ?, ?)",,{ position:PLAYER_ID ,position:PLAYER_POSITION ,nPositionId});

:PROCEDURE Add;
	:PARAMETERS position;
	
	:DECLARE nPositionId;
	nPositionId:= LIMSSetCounter("NL_POSITION","POSITION_ID","",{"No Insert"},{});
	
		RunSQL("insert into NL_POSITION (NAME, POSITION, CLUB, POSITION_ID ,USRNAM) values (?, ?, ?, ?, ?)",,{ position:NAME ,position:POSITION ,position:CLUB ,nPositionId ,MYUSERNAME});
	:RETURN nPositionId;
:ENDPROC;

