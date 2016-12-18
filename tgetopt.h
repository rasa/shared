/** \file tgetopt.h
	A version of the getopt library for use with wide character strings. 

	This is simply the gnu getopt library, but converted for use with
	TCHAR instead of char. This is not usually useful since the argv
	array is always defined to be of type char**, but in fish, all
	internal commands use wide characters and hence this library is
	useful.

	If you want to use this version of getopt in your program,
	download the fish sourcecode, available at <a
	href='http://roo.no-ip.org/fish/'>the fish homepage</a>. Extract
	the sourcode, copy tgetopt.c and tgetopt.h into your program
	directory, include tgetopt.h in your program, and use all the
	regular getopt functions, prefixing every function, global
	variable and structure with a 'w', and use only wide character
	strings. There are no other functional changes in this version of
	getopt besides using wide character strings.

	For examples of how to use tgetopt, see the fish builtin
	functions, many of which are defined in builtin.c.

*/


/* Declarations for getopt.
   Copyright (C) 1989, 90, 91, 92, 93, 94 Free Software Foundation, Inc.

This file is part of the GNU C Library.  Its master source is NOT part of
the C library, however.  The master source lives in /gd/gnu/lib.

The GNU C Library is free software; you can redistribute it and/or
modify it under the terms of the GNU Library General Public License as
published by the Free Software Foundation; either version 2 of the
License, or (at your option) any later version.

The GNU C Library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Library General Public License for more details.

You should have received a copy of the GNU Library General Public
License along with the GNU C Library; see the file COPYING.LIB.  If
not, write to the Free Software Foundation, Inc., 675 Mass Ave,
Cambridge, MA 02139, USA.  */

#if defined(UNICODE) || defined(_UNICODE)

#ifndef TGETOPT_H
#define TGETOPT_H

#include <tchar.h>

#ifdef	__cplusplus
extern "C" {
#endif

/** For communication from `getopt' to the caller.
   When `getopt' finds an option that takes an argument,
   the argument value is returned here.
   Also, when `ordering' is RETURN_IN_ORDER,
   each non-option ARGV-element is returned here.  */

extern TCHAR *toptarg;

/** Index in ARGV of the next element to be scanned.
   This is used for communication to and from the caller
   and for communication between successive calls to `getopt'.

   On entry to `getopt', zero means this is the first call; initialize.

   When `getopt' returns EOF, this is the index of the first of the
   non-option elements that the caller should itself scan.

   Otherwise, `toptind' communicates from one call to the next
   how much of ARGV has been scanned so far.  */

extern int toptind;

/** Callers store zero here to inhibit the error message `getopt' prints
   for unrecognized options.  */

extern int topterr;

/** Set to an option character which was unrecognized.  */

extern int toptopt;

/** Describe the long-named options requested by the application.
   The LONG_OPTIONS argument to getopt_long or getopt_long_only is a vector
   of `struct option' terminated by an element containing a name which is
   zero.

   The field `has_arg' is:
   no_argument		(or 0) if the option does not take an argument,
   required_argument	(or 1) if the option requires an argument,
   optional_argument 	(or 2) if the option takes an optional argument.

   If the field `flag' is not NULL, it points to a variable that is set
   to the value given in the field `val' when the option is found, but
   left unchanged if the option is not found.

   To have a long-named option do something other than set an `int' to
   a compiled-in constant, such as set a value from `optarg', set the
   option's `flag' field to zero and its `val' field to a nonzero
   value (the equivalent single-letter option character, if there is
   one).  For long options that have a zero `flag' field, `getopt'
   returns the contents of the `val' field.  */

struct toption
{
	/**
	   long name for switch
	*/
#if defined (__STDC__) && __STDC__
  const TCHAR *name;
#else
  TCHAR *name;
#endif
	/** 
		Must be one of no_argument, required_argument and
		optional_argument.

		has_arg can't be an enum because some compilers complain about
		type mismatches in all the code that assumes it is an int.  
	*/
  int has_arg;

	/**
	  If non-null, the flag whose value should be set if this switch is encountered
	*/
  int *flag;

	/**
	  If \c flag is non-null, this is the value that flag will be set
	  to. Otherwise, this is the return-value of the function call.
	*/
  int val;
};

/* Names for the values of the `has_arg' field of `struct option'.  */

/**
   Specifies that a switch does not accept an argument
*/
#define	no_argument		0
/**
   Specifies that a switch requires an argument
*/
#define required_argument	1
/**
   Specifies that a switch accepts an optional argument
*/
#define optional_argument	2

#if 1 // defined (__STDC__) && __STDC__
#if 1 // def __GNU_LIBRARY__
/** 
	Get options from argument list. See the glibc manual for information on how to use this function.
*/
extern int tgetopt (int argc, TCHAR *const *argv, const TCHAR *shortopts);
#else /* not __GNU_LIBRARY__ */

extern int tgetopt ();
#endif /* __GNU_LIBRARY__ */
/** 
	Get options from argument list. See the glibc manual for information on how to use this function.
 */
extern int tgetopt_long (
	int argc,
	TCHAR *const *argv,
	const TCHAR *shortopts,
	const struct toption *longopts,
	int *longind
);
/** 
	Get options from argument list. See the glibc manual for information on how to use this function.
 */
extern int tgetopt_long_only (int argc, TCHAR *const *argv,
			     const TCHAR *shortopts,
		             const struct toption *longopts, int *longind);

/** 
	Internal only.  Users should not call this directly.  
*/
extern int _tgetopt_internal (int argc, TCHAR *const *argv,
			     const TCHAR *shortopts,
		             const struct toption *longopts, int *longind,
			     int long_only);
#else /* not __STDC__ */

/** 
	Get options from argument list. See the glibc manual for information on how to use this function.
 */
extern int tgetopt ();

/** 
	Get options from argument list. See the glibc manual for information on how to use this function.
 */
extern int tgetopt_long ();

/** 
	Get options from argument list. See the glibc manual for information on how to use this function.
 */
extern int tgetopt_long_only ();

/** 
	Internal only.  Users should not call this directly.  
*/
extern int _tgetopt_internal ();
#endif /* __STDC__ */

#ifdef	__cplusplus
}
#endif

#endif /* TGETOPT_H */

#endif /* defined(UNICODE) || defined(_UNICODE) */
