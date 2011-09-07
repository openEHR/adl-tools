#
# component:   "openEHR ADL Reference Parser"
# description: "Makefile for JNI wrapper for Eiffel ADL reference parser.
#              This makefile is designed to work with MS nmake, under cygwin.
#              It should be easy to make it work on any unix variant by changing
#              the INCLUDE_PATH, CFLAGS, CPPFLAGS appropriately."
# keywords:    "ADL, archetype, JNI, wrapper"
#
# author:      "Thomas Beale <Thomas.Beale@OceanInformatics.biz>"
# support:     "Thomas Beale <Thomas.Beale@OceanInformatics.biz>"
# copyright:   "Copyright (c) 2004,2005 Ocean Informatics Australia"
# license:     "See notice at bottom of class"
#
# file:        "$Source$"
# revision:    "$Revision$"
# last_change: "$Date$"
# 

INCLUDE_PATH = -I$(GOBO)\gobo32\library\kernel\include -I"$(JDK_1_5)\include" -I"$(JDK_1_5)\include\win32" -I$(ISE_EIFFEL)\studio\spec\$(ISE_PLATFORM)\include
SHELL = \bin\sh
CC = cl
CPP = cl
CFLAGS = -Ox -w -YX -nologo -DNONAMELESSUNION -I. $(INCLUDE_PATH)
CPPFLAGS = -Ox -w -YX -nologo -DNONAMELESSUNION -I. $(INCLUDE_PATH)
LDFLAGS =
LIBS = 
MAKE = nmake -s -nologo
AR = 
LD = 
MKDEP =   --
MV = copy
CP = copy
RANLIB = echo
RM = del
FILE_EXIST = if exist
RMDIR = rd
COMMAND_MAKEFILE = 
START_TEST = if not exist finished 
END_TEST =  
.SUFFIXES: .obj 

.c.obj:
	$(CC) $(CFLAGS) -c $<

.cpp.obj:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = org_openehr_archetypes_adl_jni_wrapper_AdlJniWrapper.obj
INCLUDES = org_openehr_archetypes_adl_jni_wrapper_AdlJniWrapper.h

all::  adl_jni_wrapper.lib adl_jni_wrapper_exports.def

adl_jni_wrapper.lib: $(OBJECTS) Makefile
	if exist $@ $(RM) $@
	lib -nologo -OUT:$@ $(OBJECTS)

adl_jni_wrapper_exports.def: $(INCLUDES)
	grep JNIEXPORT $(INCLUDES) | sed -n 's/^JNIEXPORT.*JNICALL //p' > $@

clean::
	$(RM) core finished *.o *.def


#
#  ***** BEGIN LICENSE BLOCK *****
#  Version: MPL 1.1/GPL 2.0/LGPL 2.1
#
#  The contents of this file are subject to the Mozilla Public License Version
#  1.1 (the 'License'); you may not use this file except in compliance with
#  the License. You may obtain a copy of the License at
#  http://www.mozilla.org/MPL/
#
#  Software distributed under the License is distributed on an 'AS IS' basis,
#  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
#  for the specific language governing rights and limitations under the
#  License.
#
#  The Original Code is Makefile
#
#  The Initial Developer of the Original Code is Rong Chen.
#  Portions created by the Initial Developer are Copyright (C) 2003-2004
#  the Initial Developer. All Rights Reserved.
#
#  Contributor(s):
#
# Software distributed under the License is distributed on an 'AS IS' basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
#  ***** END LICENSE BLOCK *****
#
