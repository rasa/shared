.PHONY:	all clean realclean

all:
	MSBuild.exe shared.sln /t:Build /p:Configuration=Debug
	MSBuild.exe shared.sln /t:Build /p:Configuration=Release
	MSBuild.exe shared.sln /t:Build /p:Configuration=Debug_Unicode
	MSBuild.exe shared.sln /t:Build /p:Configuration=Release_Unicode

clean:
	MSBuild.exe shared.sln /t:Clean /p:Configuration=Debug
	MSBuild.exe shared.sln /t:Clean /p:Configuration=Release
	MSBuild.exe shared.sln /t:Clean /p:Configuration=Debug_Unicode
	MSBuild.exe shared.sln /t:Clean /p:Configuration=Release_Unicode

realclean: clean
	-cmd /c del /s *.bak *.bsc *.idb *.pdb *.lib *.ncb *.obj *.opt *.pch *.plg *.sbr
