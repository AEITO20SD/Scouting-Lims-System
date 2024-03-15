/********************************************************************************
Description.. :	

Parameters... :	- 

Returns...... :	- 

Author....... :	SYSADM
Date......... : 2024-02-22
********************************************************************************
_______________________________________________________________________________

Modification. : 
Author....... :	
Date......... :	
_______________________________________________________________________________
********************************************************************************/;
:PARAMETERS player;

usrmes("Name", player:Name);

:DECLARE nId;
nId := LIMSSetCounter("NL_PLAYER","ID","",{"No Insert"},{});

RunSQL("insert into NL_PLAYER (ID, NAME, CITY, EMAIL, PHONE, USRNAM, LOGDATE) 
			values (?, ?, ?, ?, ?, ?, ?)",,{nId, player:Name,player:City ,player:Email ,player:Phone , MYUSERNAME, Now()});
:RETURN nId;
