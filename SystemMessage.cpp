// Copyright (c) 2005-2015 Ross Smith II. See Mit LICENSE in /LICENSE

#ifdef _MSC_VER
#pragma warning(disable:4996)
#endif

#include <windows.h>
#include <stdio.h>

#include "SystemMessage.h"

wchar_t *SystemMessageW(const DWORD message_id)
{
	static wchar_t buf[2048];

	int rv = FormatMessageW(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
		NULL, message_id, MAKELANGID (LANG_NEUTRAL, SUBLANG_DEFAULT),
		(wchar_t *) &buf, sizeof (buf), NULL);

	if (rv == 0)
		_snwprintf(buf, sizeof(buf), L"Unknown Windows error %d", message_id);

	return buf;
}

char *SystemMessageA(const DWORD message_id)
{
	static char buf[2048];

	int rv = FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
		NULL, message_id, MAKELANGID (LANG_NEUTRAL, SUBLANG_DEFAULT),
		(char *) &buf, sizeof (buf), NULL);

	if (rv == 0)
		_snprintf(buf, sizeof(buf), "Unknown Windows error %d", message_id);

	return buf;
}
