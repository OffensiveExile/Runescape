@ECHO off
REM Originally created by /u/Cameronza. Updated by /u/OffensiveExile.

ECHO OldSchool Runescape - World Pinger!
ECHO Version 0.2 - Credits to /u/Cameronza.
ECHO.
SETLOCAL enabledelayedexpansion
SET preword=300
ECHO A percentage of the world ping is added to the world ping to find more worlds.
ECHO Type 0 if you want to find the absolute lowest world ping possible.
ECHO Type 9999 if you want to find all words.
SET /p percentage="Percentage: "
ECHO.
ECHO If no worlds show, please wait until instructed otherwise.
FOR /L %%i IN ( 1,1,99) DO (
	FOR /f "tokens=4 delims=Replyfrombytes=time<ms" %%x in ('Ping oldschool%%i.runescape.com -w 1000 -n 1 ^| find "TTL" ') DO (
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
