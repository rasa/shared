/*

$Id$

Copyright (c) 2005-2006 Ross Smith II (http://smithii.com). All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the terms of version 2 of the GNU General Public License 
as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

*/

#ifndef DEBUG_H
#define DEBUG_H

#include <wchar.h>

extern void dprintfA(const char* str, ...);
extern void dprintfW(const wchar_t* str, ...);
extern void dsetA(char* file, int line);
extern void dsetW(wchar_t* file, int line);
extern void dsettime(int time);

#ifdef _DEBUG

#if defined(UNICODE) || defined(_UNICODE)
#define D(args) dsetA(((char*)__FILE__), __LINE__); dprintfW args
#else
#define D(args) dsetA(((char*)__FILE__), __LINE__); dprintfA args
#endif
#define DSETTIME(i) dsettime(i)
#else
#define D(args)
#define DSETTIME(i)
#endif

#endif // DEBUG_H
