# Microsoft Developer Studio Generated NMAKE File, Based on shared.dsp
!IF "$(CFG)" == ""
CFG=shared - Win32 Debug_Unicode
!MESSAGE No configuration specified. Defaulting to shared - Win32 Debug_Unicode.
!ENDIF 

!IF "$(CFG)" != "shared - Win32 Release" && "$(CFG)" != "shared - Win32 Debug" && "$(CFG)" != "shared - Win32 Debug_Unicode" && "$(CFG)" != "shared - Win32 Release_Unicode"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "shared.mak" CFG="shared - Win32 Debug_Unicode"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "shared - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "shared - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "shared - Win32 Debug_Unicode" (based on "Win32 (x86) Static Library")
!MESSAGE "shared - Win32 Release_Unicode" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "shared - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release

ALL : ".\shared.lib"


CLEAN :
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\Stackwalker.obj"
	-@erase "$(INTDIR)\SystemMessage.obj"
	-@erase "$(INTDIR)\tgetopt.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase ".\shared.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /Fp"$(INTDIR)\shared.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\shared.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"shared.lib" 
LIB32_OBJS= \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\Stackwalker.obj" \
	"$(INTDIR)\SystemMessage.obj" \
	"$(INTDIR)\tgetopt.obj"

".\shared.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "shared - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : ".\sharedd.lib" "$(OUTDIR)\shared.bsc"


CLEAN :
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\Stackwalker.obj"
	-@erase "$(INTDIR)\Stackwalker.sbr"
	-@erase "$(INTDIR)\SystemMessage.obj"
	-@erase "$(INTDIR)\SystemMessage.sbr"
	-@erase "$(INTDIR)\tgetopt.obj"
	-@erase "$(INTDIR)\tgetopt.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\shared.bsc"
	-@erase ".\sharedd.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\shared.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\shared.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\Stackwalker.sbr" \
	"$(INTDIR)\SystemMessage.sbr" \
	"$(INTDIR)\tgetopt.sbr"

"$(OUTDIR)\shared.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"sharedd.lib" 
LIB32_OBJS= \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\Stackwalker.obj" \
	"$(INTDIR)\SystemMessage.obj" \
	"$(INTDIR)\tgetopt.obj"

".\sharedd.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "shared - Win32 Debug_Unicode"

OUTDIR=.\Debug_Unicode
INTDIR=.\Debug_Unicode
# Begin Custom Macros
OutDir=.\Debug_Unicode
# End Custom Macros

ALL : ".\shareddu.lib" "$(OUTDIR)\shared.bsc"


CLEAN :
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\debug.sbr"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\getopt.sbr"
	-@erase "$(INTDIR)\Stackwalker.obj"
	-@erase "$(INTDIR)\Stackwalker.sbr"
	-@erase "$(INTDIR)\SystemMessage.obj"
	-@erase "$(INTDIR)\SystemMessage.sbr"
	-@erase "$(INTDIR)\tgetopt.obj"
	-@erase "$(INTDIR)\tgetopt.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\shared.bsc"
	-@erase ".\shareddu.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "_DEBUG" /D "WIN32" /D "_LIB" /D "UNICODE" /D "_UNICODE" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\shared.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\shared.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\debug.sbr" \
	"$(INTDIR)\getopt.sbr" \
	"$(INTDIR)\Stackwalker.sbr" \
	"$(INTDIR)\SystemMessage.sbr" \
	"$(INTDIR)\tgetopt.sbr"

"$(OUTDIR)\shared.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"shareddu.lib" 
LIB32_OBJS= \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\Stackwalker.obj" \
	"$(INTDIR)\SystemMessage.obj" \
	"$(INTDIR)\tgetopt.obj"

".\shareddu.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "shared - Win32 Release_Unicode"

OUTDIR=.\Release_Unicode
INTDIR=.\Release_Unicode

ALL : ".\sharedu.lib"


CLEAN :
	-@erase "$(INTDIR)\debug.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\Stackwalker.obj"
	-@erase "$(INTDIR)\SystemMessage.obj"
	-@erase "$(INTDIR)\tgetopt.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase ".\sharedu.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_LIB" /D "UNICODE" /D "_UNICODE" /Fp"$(INTDIR)\shared.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\shared.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"sharedu.lib" 
LIB32_OBJS= \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\getopt.obj" \
	"$(INTDIR)\Stackwalker.obj" \
	"$(INTDIR)\SystemMessage.obj" \
	"$(INTDIR)\tgetopt.obj"

".\sharedu.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("shared.dep")
!INCLUDE "shared.dep"
!ELSE 
!MESSAGE Warning: cannot find "shared.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "shared - Win32 Release" || "$(CFG)" == "shared - Win32 Debug" || "$(CFG)" == "shared - Win32 Debug_Unicode" || "$(CFG)" == "shared - Win32 Release_Unicode"
SOURCE=.\debug.cpp

!IF  "$(CFG)" == "shared - Win32 Release"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug_Unicode"


"$(INTDIR)\debug.obj"	"$(INTDIR)\debug.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Release_Unicode"


"$(INTDIR)\debug.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\getopt.c

!IF  "$(CFG)" == "shared - Win32 Release"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug_Unicode"


"$(INTDIR)\getopt.obj"	"$(INTDIR)\getopt.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Release_Unicode"


"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\Stackwalker.cpp

!IF  "$(CFG)" == "shared - Win32 Release"


"$(INTDIR)\Stackwalker.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug"


"$(INTDIR)\Stackwalker.obj"	"$(INTDIR)\Stackwalker.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug_Unicode"


"$(INTDIR)\Stackwalker.obj"	"$(INTDIR)\Stackwalker.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Release_Unicode"


"$(INTDIR)\Stackwalker.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\SystemMessage.cpp

!IF  "$(CFG)" == "shared - Win32 Release"


"$(INTDIR)\SystemMessage.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug"


"$(INTDIR)\SystemMessage.obj"	"$(INTDIR)\SystemMessage.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug_Unicode"


"$(INTDIR)\SystemMessage.obj"	"$(INTDIR)\SystemMessage.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Release_Unicode"


"$(INTDIR)\SystemMessage.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\tgetopt.c

!IF  "$(CFG)" == "shared - Win32 Release"


"$(INTDIR)\tgetopt.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug"


"$(INTDIR)\tgetopt.obj"	"$(INTDIR)\tgetopt.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Debug_Unicode"


"$(INTDIR)\tgetopt.obj"	"$(INTDIR)\tgetopt.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "shared - Win32 Release_Unicode"


"$(INTDIR)\tgetopt.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 


!ENDIF 

