// Copyright (c) 2002-2016 Ross Smith II. See Mit LICENSE in /LICENSE

#ifndef VER_INTERNAL_NAME
#pragma message("Please define VER_INTERNAL_NAME")
#define VER_INTERNAL_NAME       "shared"
#endif

#ifndef VER_FILE_DESCRIPTION
#pragma message("Please define VER_FILE_DESCRIPTION")
#define VER_FILE_DESCRIPTION    ""
#endif

#ifndef VER_COMPANY_NAME
#define VER_COMPANY_NAME        "Ross Smith II (http://smithii.com)"
#endif

#ifndef VER_LEGAL_COPYRIGHT
#define VER_LEGAL_COPYRIGHT     "Copyright (c) 2002-2016 Ross Smith II. MIT Licensed."
#endif

#ifndef VER_COMMENTS
#define VER_COMMENTS            ""
#endif

#ifndef VER_MAJOR
#define VER_MAJOR               1
#endif

#ifndef VER_MINOR
#define VER_MINOR               4
#endif

#ifndef VER_STRING2
#define VER_STRING2             "1.4"
#endif

#ifndef VER_REVISION
#define VER_REVISION            0
#endif

#ifndef VER_STRING3
#define VER_STRING3             VER_STRING2 ".0"
#endif

#ifndef VER_BUILD
#define VER_BUILD               0
#endif

#ifndef VER_STRING4
#define VER_STRING4             VER_STRING3 ".0"
#endif

#ifndef VER_FILE_VERSION
#define VER_FILE_VERSION        VER_MAJOR,VER_MINOR,VER_REVISION,VER_BUILD
#endif

#ifndef VER_FILE_STRING
#define VER_FILE_STRING         VER_STRING4
#endif

#ifndef VER_ORIGINAL_FILENAME
#define VER_ORIGINAL_FILENAME   VER_INTERNAL_NAME ".exe"
#endif

#ifndef VER_PRODUCT_NAME
#define VER_PRODUCT_NAME        VER_FILE_DESCRIPTION
#endif

#ifndef VER_PRODUCT_VERSION
#define VER_PRODUCT_VERSION     VER_FILE_VERSION
#endif

#ifndef VER_PRODUCT_STRING
#define VER_PRODUCT_STRING      VER_STRING4
#endif
