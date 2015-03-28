all:
	VCBuild.exe /nologo shared.vcproj /rebuild

clean:
	VCBuild.exe /nologo shared.vcproj /clean
	
upgrade:
	devenv shared.sln /upgrade

.PHONY:	all clean upgrade

