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

