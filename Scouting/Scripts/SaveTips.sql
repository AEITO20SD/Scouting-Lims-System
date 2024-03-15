/********************************************************************************
Description.. :	

Parameters... :	- 

Returns...... :	- 

Author....... :	SYSADM
Date......... : 2024-03-12
********************************************************************************
_______________________________________________________________________________

Modification. : 
Author....... :	
Date......... :	
_______________________________________________________________________________
********************************************************************************/;
:PROCEDURE Add;
	:PARAMETERS Tips;
	
	:DECLARE nTipsId;
	 nTipsId:= LIMSSetCounter("NL_SCOUTER","SCOUTER_ID","",{"No Insert"},{});
	
		RunSQL("insert into NL_SCOUTER (T_TYPE, URL, SCOUTER_ID) values (?, ?, ?)",,{Tips:T_TYPE ,Tips:URL ,nTipsId});
	:RETURN nTipsId;
:ENDPROC;
