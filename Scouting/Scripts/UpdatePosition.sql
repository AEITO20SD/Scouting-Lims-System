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
:PROCEDURE EditList;
    :PARAMETERS  UpdateList;
    :DECLARE nUpListId;

    nUpListId := DoProc("GetMyListId", {UpdateList});
  	ExecFunction("Player_Profile.Player.UpdatePost", {UpdateList});

    :RETURN nUpListId;
:ENDPROC;

:PROCEDURE UpdateGoals;
	:PARAMETERS UpdateList;
	usrmes(UpdateList);
	RunSql("update NL_POSITION set GOALS = ? where POSITION_ID = ? ",, { UpdateList:GOALS ,nUpListId});
:ENDPROC;

:PROCEDURE GetMyListId;
	:RETURN LSearch("
		select
			POSITION_ID
		from
			NL_POSITION
		where
			POSITION_ID = ?", 
		0,, {nUpListId} );
:ENDPROC;
