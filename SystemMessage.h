// Copyright (c) 2005-2015 Ross Smith II. See Mit LICENSE in /LICENSE

#ifndef SYSTEMMESSAGE_H
#define SYSTEMMESSAGE_H

#include <wchar.h>

extern char *SystemMessageA(const DWORD message_id);
extern wchar_t *SystemMessageW(const DWORD message_id);

#if defined(UNICODE) || defined(_UNICODE)
#define SystemMessage(x) SystemMessageA(x)
#else
#define SystemMessage(x) SystemMessageA(x)
#endif

#endif // SYSTEMMESSAGE_H

