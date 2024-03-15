/********************************************************************************
Description.. :	

Parameters... :	- 

Returns...... :	- 

Author....... :	SYSADM
Date......... : 2024-02-29
********************************************************************************
_______________________________________________________________________________

Modification. : 
Author....... :	
Date......... :	
_______________________________________________________________________________
********************************************************************************/;
:PROCEDURE Add;
	:PARAMETERS post;
	
	:DECLARE nPostId;
	nPostId := LIMSSetCounter("NL_POST","POST_ID","",{"No Insert"},{});
	
		RunSQL("insert into NL_POST (POST_ID, PLAYER_ID, DESCRIPTION, URL)
								values (?, ?, ?, ?)",,{nPostId, post:Player_Id, post:Description, post:Url});
	:RETURN nPostId;
:ENDPROC;
