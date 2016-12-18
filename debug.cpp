// Copyright (c) 2005-2016 Ross Smith II. See Mit LICENSE in /LICENSE

#ifdef _DEBUG

#ifdef _MSC_VER
#pragma warning(disable:4996)
#endif

#include "debug.h"

#ifndef WIN32_LEAN_AND_MEAN
# define WIN32_LEAN_AND_MEAN 1
#endif

#include <windows.h>
#include <stdio.h>
#include <stdarg.h>
#include <time.h>
#include <sys/types.h>
#include <sys/timeb.h>
#include <stdlib.h>

static int __time = 1;
#if defined(UNICODE) || defined(_UNICODE)
static wchar_t __file[255];
#define _FS "%ls"
#else
static char __file[255];
#define _FS "%hs"
#endif

static int __line;

void dsettime(int time) {
	__time = time;
}

#if defined(UNICODE) || defined(_UNICODE)
void dsetA(wchar_t* file, int line) {
	wchar_t fname[_MAX_FNAME];
	wchar_t ext[_MAX_EXT];
	_wsplitpath(file, NULL, NULL, fname, ext);
	wcscpy(__file, fname);
	wcscat(__file, ext);
	__line = line;
}
#else
void dsetA(char* file, int line) {
	char fname[_MAX_FNAME];
	char ext[_MAX_EXT];
	_splitpath(file, NULL, NULL, fname, ext);
	strcpy(__file, fname);
	strcat(__file, ext);
	__line = line;
}
#endif

void dprintfA(const char* str, ...) {
	va_list marker;
	va_start(marker, str);

	static char buffer[65536];
	static char buffer2[65536];

	if (__time) {
	    static struct _timeb tb;
		static struct tm *t;
	    _ftime(&tb);
		t = localtime(&tb.time);
		sprintf(buffer, "%02d:%02d:%02d.%04d: ", t->tm_hour, t->tm_min, t->tm_sec, tb.millitm);
	} else {
		buffer[0] = '\0';
	}

	if (__file) {
		sprintf(buffer2, _FS ":%d: ", __file, __line);
		strcat(buffer, buffer2);
	}

	vsprintf(buffer2, str, marker);
	strcat(buffer, buffer2);
	strcat(buffer, "\n");
	OutputDebugStringA(buffer);
}

void dprintfW(const wchar_t* str, ...) {
	va_list marker;
	va_start(marker, str);

	static wchar_t buffer[65536];
	static wchar_t buffer2[65536];

	if (__time) {
	    static struct _timeb tb;
		static struct tm *t;
	    _ftime(&tb);
		t = localtime(&tb.time);
		swprintf(buffer, L"%02d:%02d:%02d.%04d: ", t->tm_hour, t->tm_min, t->tm_sec, tb.millitm);
	} else {
		buffer[0] = '\0';
	}

	if (__file) {
		swprintf(buffer2, L"%s:%d: ", (wchar_t *) __file, __line);
		wcscat(buffer, buffer2);
	}

	vswprintf(buffer2, str, marker);
	wcscat(buffer, buffer2);
	wcscat(buffer, L"\n");
	OutputDebugStringW(buffer);
}

#endif // _DEBUG
