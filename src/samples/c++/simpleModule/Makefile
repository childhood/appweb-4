#
#	Makefile for the simpleModule sample
#
#	Copyright (c) Embedthis Software, 2003-2012. All Rights Reserved.
#

NAME			:= simpleModule
BLD_CXX         := g++
COMPILE         += *.cpp

include 		.makedep

TARGETS			+= $(BLD_LIB_DIR)/$(NAME)$(BLD_SHOBJ)

compileExtra: 	$(BLD_LIB_DIR)/$(NAME)$(BLD_SHOBJ)

$(BLD_LIB_DIR)/$(NAME)$(BLD_SHOBJ): $(OBJECTS)
	@bld --shared --library $(BLD_LIB_DIR)/$(NAME) --libs "$(BLD_APPWEB_LIBS)" $(OBJECTS)

projectsExtra:
	@makeVsProj --project $(NAME).vcproj --library $(NAME) --libs "$(BLD_APPWEB_LIBS)" *.c

#
#   Local variables:
#   tab-width: 4
#   c-basic-offset: 4
#   End:
#   vim: sw=4 ts=4 noexpandtab
#
