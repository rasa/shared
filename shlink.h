#include <windows.h>
//#include <shellapi.h>
#include <shlobj.h>

#include <stdio.h>
#include <stdlib.h>

#if !defined(OPTIONAL)
# define OPTIONAL /*param is optional, pass as NULL or 0 if not used*/
#endif

// Create Shortcuts with IShellLink and IPersistFile.
// FYI: this function is based on a trivial example in Microsoft VC++ doc's.

HRESULT
CreateShellLink(
	LPSTR lpszTargetPath,       // existing object shortcut will point to
	LPSTR lpszLinkPath,          // path to shortcut (MUST END IN .lnk)
	LPSTR lpszCWD OPTIONAL,      // working directory when launching shortcut
	LPSTR lpszDesc OPTIONAL,     // description (not apparent how this is used)
	LPSTR lpszIconPath OPTIONAL, // path to file containing icon resource
	int   iIconIndex OPTIONAL,   // index of icon in above file
	LPSTR lpszArguments OPTIONAL // command-line arguments 
	)
{
    HRESULT hres; 
    IShellLink* psl; 
 
    // Get a pointer to the IShellLink interface. 

    hres = CoCreateInstance(CLSID_ShellLink, NULL, 
                            CLSCTX_INPROC_SERVER, IID_IShellLink, (LPVOID*)&psl); 
    if (SUCCEEDED(hres)) { 
        IPersistFile* ppf; 
 
		// Set the path to the shortcut target, and add the 
		// description. 

//SetPath	Sets the path and file name of a Shell link object.
//SetArguments	Sets the command-line arguments for a Shell link object.
//SetDescription	Sets the description for a Shell link object. The description can be any application-defined string.
//SetIconLocation	Sets the location (path and index) of the icon for a Shell link object.
//SetWorkingDirectory	Sets the name of the working directory for a Shell link object.

//SetHotkey	Sets a hot key for a Shell link object.
//SetIDList	Sets the pointer to an item identifier list (PIDL) for a Shell link object.
//SetRelativePath	Sets the relative path to the Shell link object.
//SetShowCmd	Sets the show command for a Shell link object. The show command sets the initial show state of the window.

		psl->SetPath(lpszTargetPath); 

		if (lpszDesc)      psl->SetDescription(lpszDesc); 
		if (lpszIconPath)  psl->SetIconLocation(lpszIconPath,
																 iIconIndex);
		if (lpszArguments) psl->SetArguments(lpszArguments);
		if (lpszCWD)       psl->SetWorkingDirectory(lpszCWD);

		// Query IShellLink for the IPersistFile interface for saving the 
		// shortcut in persistent storage. 

        hres = psl->QueryInterface(IID_IPersistFile, (LPVOID*)&ppf); 
 
        if (SUCCEEDED(hres)) { 
            WORD wsz[MAX_PATH]; 
 
            // Ensure that the string is ANSI. 
            MultiByteToWideChar(CP_ACP, 0, lpszLinkPath, -1, wsz, MAX_PATH); 
 
            // Save the link by calling IPersistFile::Save. 
            hres = ppf->Save(wsz, TRUE); 
            ppf->Release(); 
        } 
        psl->Release(); 
    }
    return hres; 
}
