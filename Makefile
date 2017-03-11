# Much of this makefile is nicked from RapidFit and slimmed down considerably
# Compiler and shell
CC         = g++
SHELL      = /bin/bash
RM         = rm -f

# Name the library
MAIN       = CloneTagger

# Extensions
SRCEXT     = cpp
HDREXT     = h
OBJEXT     = o
LIBEXT     = so

# Directories
SRCDIR     = src
HDRDIR     = include
OBJDIR     = build
LIBDIR     = lib

# Get files and make list of objects and libraries
SRCS      := $(shell find $(SRCDIR) -name '*.$(SRCEXT)')
HDRS      := $(shell find $(HDRDIR) -name '*.$(HDREXT)')
OBJS      := $(patsubst $(SRCDIR)/%.$(SRCEXT),$(OBJDIR)/%.$(OBJEXT),$(SRCS))

# Where the output is
OUTPUT     = $(OBJDIR)/*.$(OBJEXT) $(LIBDIR)/*.$(LIBEXT)

# Compiler flags
CXXFLAGS   = -Wall -Werror -fPIC -I$(HDRDIR)

# Make the libraries
all : $(LIBDIR)/lib$(MAIN).$(LIBEXT)
# Make object files
objects : $(OBJS)
# Return flags for compiling with this library
incflags :
	@echo -I$(shell pwd)/$(HDRDIR)
libflags :
	@echo -L$(shell pwd)/$(LIBDIR) -l$(MAIN)
# Build libraries
$(LIBDIR)/lib%.$(LIBEXT) : $(OBJS) | $(LIBDIR)
	@echo "Making shared object $@"
	@$(CC) -shared $^ -o $@
# Build objects
$(OBJDIR)/%.$(OBJEXT) : $(SRCDIR)/%.$(SRCEXT) $(HDRS) | $(OBJDIR)
	@echo "Compiling $@"
	@$(CC) -c $< -o $@ $(CXXFLAGS)
$(OBJDIR) $(LIBDIR) :
	mkdir -p $@
# Remove all the output
clean :
	$(RM) $(OUTPUT)
.PHONY : all clean objects libflags
