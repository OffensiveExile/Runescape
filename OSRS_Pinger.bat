@ECHO off
REM Originally created by /u/Cameronza. Updated by /u/OffensiveExile.

ECHO OldSchool Runescape - World Pinger!
ECHO.
SETLOCAL enabledelayedexpansion
SET osworld=1,2,3,4,5,6,8,9,10,11,12,13,14,16,17,18,19,20,21,22,25,26,27,28,29,30,33,34,35,36,37,38,41,42,43,44,45,46,49,50,51,52,53,54,57,58,59,60,61,62,65,66,67,68,69,70,73,74,75,76,77,78,81,82,83,84,85,86,93,94
SET preword=300
ECHO A percentage of the world ping is added to the world ping to find more worlds.
ECHO Type 0 if you want to find the absolute lowest world ping possible.
ECHO Type 9999 if you want to find all words.
SET /p percentage="Percentage: "
ECHO.
ECHO If no worlds show, please wait until instructed otherwise.
FOR %%i IN (%osworld%) DO (
	FOR /f "tokens=4 delims=Replyfrombytes=time<ms" %%x in ('Ping oldschool%%i.runescape.com -n 1 ^| find "TTL" ') DO (
		set /a world=preword+%%i
		IF !osping! GEQ %%x (
			ECHO WORLD_!world! = %%x ms
			SET /a osping = %%x*percentage
			SET /a osping = !osping:~0,-2!+%%x

		) ELSE IF %%i==1 (
			SET /a osping = %%x*percentage
			SET /a osping = !osping:~0,-2!+%%x
			ECHO WORLD_!world! = %%x ms - This is usually the highest ping based on your region.
		)
	)
)
ECHO All low ping responsive worlds are shown.
ECHO If none are listed, the worlds are offline or there is a connectivity issue.
pause
