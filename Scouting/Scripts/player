
:PROCEDURE Add;
	:PARAMETERS player;
	
	:DECLARE nId;
	nId := LIMSSetCounter("NL_PLAYER","ID","",{"No Insert"},{});
	
	RunSQL("insert into NL_PLAYER (ID, NAME, CITY, EMAIL, PHONE, USRNAM, LOGDATE) 
				values (?, ?, ?, ?, ?, ?, ?)",,{nId, player:Name,player:City ,player:Email ,player:Phone , MYUSERNAME, Now()});
	:RETURN nId;
:ENDPROC;

:PROCEDURE Update;
	:PARAMETERS nPlayerId, UpdatePlayer;
	usrmes(UpdatePlayer);
	RunSql("update NL_PLAYER set NAME = ?, CITY = ?, EMAIL = ?, PHONE = ? where ID = ?",, { UpdatePlayer:Name ,UpdatePlayer:City ,UpdatePlayer:Email ,UpdatePlayer:Phone, nPlayerId});
:ENDPROC;

:PROCEDURE UpdatePost;
	:PARAMETERS UpdatePost;
	usrmes(UpdatePost);
	RunSql("update NL_POST set DESCRIPTION = ?, URL = ? where POST_ID = ? ",, { UpdatePost:Description ,UpdatePost:Url, nUpPostId});
:ENDPROC;

:PROCEDURE PlayerExistsAsUser;

:DECLARE  nExists;
nExists := LSearch("select 1 from NL_PLAYER where USRNAM = ? ",0,,{MYUSERNAME});

:RETURN nExists == 1;

:ENDPROC;

:PROCEDURE Create;

	:PARAMETERS player;
	
	:DECLARE nPlayerId ;
	
	nPlayerId := DoProc("Add", {player});
	player:Player_Id := nPlayerId;
	
	ExecFunction("Player_Profile.Attributes.Add", {player});
	
	:RETURN nPlayerId;
:ENDPROC;

:PROCEDURE Edit;
    :PARAMETERS nPlayerId, UpdatePlayer;
	usrmes(nPlayerId);
	usrmes(UpdatePlayer);
  	ExecFunction("Player_Profile.Player.Update", {nPlayerId, UpdatePlayer});
    ExecFunction("Player_Profile.Attributes.UpdateAttr", {nPlayerId, UpdatePlayer});

    :RETURN nPlayerId;
:ENDPROC;

:PROCEDURE CreatePost;

	:PARAMETERS post;
	
	:DECLARE nPostId ;
	
	post:Player_Id := DoProc("GetMyPlayerId");
	
	ExecFunction("Player_Profile.Savepost.Add", {post});
	
	:RETURN nPostId;
:ENDPROC;

:PROCEDURE rHealth;

	:PARAMETERS HealthInfo;
	
	:DECLARE HealthId ;
	
	HealthInfo:Player_Id := DoProc("GetMyPlayerId");
	
	ExecFunction("Player_Profile.SaveHealth.AddHealth", {HealthInfo});
	
	:RETURN HealthId;
:ENDPROC;

:PROCEDURE GetMyPlayerId;
	:RETURN LSearch("
		select
			ID
		from
			NL_PLAYER
		where
			USRNAM = ?", 
		0,, 
		{MyUserName});
:ENDPROC;


:PROCEDURE GetMyPostId;
	:RETURN LSearch("
		select
			POST_ID
		from
			NL_POST
		where
			POST_ID = ?", 
		0,, {nUpPostId} );
:ENDPROC;


:PROCEDURE EditPost;
    :PARAMETERS  UpdatePost;
    :DECLARE nUpPostId;

    nUpPostId := DoProc("GetMyPostId", {UpdatePost});
  	ExecFunction("Player_Profile.Player.UpdatePost", {UpdatePost});

    :RETURN nUpPostId;
:ENDPROC;