:PROCEDURE Delete;

	:PARAMETERS nPostId;
	RunSql("delete from NL_POST where POST_ID = ?",, {nPostId});
:ENDPROC;

