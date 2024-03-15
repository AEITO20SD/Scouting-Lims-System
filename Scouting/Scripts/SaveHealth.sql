:PROCEDURE AddHealth;
:PARAMETERS HealthInfo;

:DECLARE HealthId;
HealthId := LIMSSetCounter("NL_HEALTH", "HEALTH_ID", "", {"No Insert"}, {});

RunSQL("
    INSERT INTO NL_HEALTH (
        BLOOD,
        HEART,
        BMI,
        FAT,
        LUNG,
        FLEXIBILITY,
        STRENGTH,
        AGILITY,
        BALANCE,
        REACTION,
        HEALTH_ID,
		PLAYER_ID
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",,
    {
        HealthInfo:Blood,
        HealthInfo:HEART,
        HealthInfo:BMI,
        HealthInfo:FAT,
        HealthInfo:LUNG,
        HealthInfo:FLEXIBILITY,
        HealthInfo:STRENGTH,
        HealthInfo:AGILITY,
        HealthInfo:BALANCE,
        HealthInfo:REACTION,
        HealthId,
		HealthInfo:PLAYER_ID
    }
);

:RETURN HealthId;
:ENDPROC;