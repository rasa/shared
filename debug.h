// Copyright (c) 2005-2015 Ross Smith II. See Mit LICENSE in /LICENSE

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
#define D(args) dsetA(((wchar_t*)__FILE__), __LINE__); dprintfW args
#else
#define D(args) dsetA(((char*)__FILE__), __LINE__); dprintfA args
#endif
#define DSETTIME(i) dsettime(i)
#else
#define D(args)
#define DSETTIME(i)
#endif

#endif // DEBUG_H
