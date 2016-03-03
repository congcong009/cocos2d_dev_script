@echo off
SET target=D:\art\bullet
rem SET /P target=Enter Target Folder:
echo Target: %target%
if not exist %target% (
    echo !! Target folder does not exist..
    goto end
)

SET fcount=
for /f "tokens=1* delims=:" %%A in ('dir "%target%\*.png" /s /b^|findstr /n "^"') do (
    SET fcount=%%A
    echo Processing ... %%B
    TexturePacker --sheet %%B --data %target%\out.plist --algorithm Basic --allow-free-size --max-width 2048 --max-height 2048 --size-constraints AnySize --no-trim --opt RGBA4444 --dither-fs-alpha --border-padding 0 --shape-padding 0 --inner-padding 0 --extrude 0 --format cocos2d %%B
)

echo --- TOTAL %fcount% file(s) processed. ---
del %target%\out.plist

:end
pause
