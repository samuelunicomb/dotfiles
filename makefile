# 
# uses automatic dependency generation, a modern make feature. hiltmot.com was
# a useful blog, detailing C++ project building. Don't care about unused functions,
# they arise frequently and should be harmless here. 
#
# -not -path '*/\.*' excludes hidden directories from build tree
#
# note : locally you're aliasing g++ to g++-8. Check what's happening on the psmn server

STD := -std=c++11
CXX := g++ $(STD)
SRCDIR := src
BUILDDIR := build
TARGET := binarystate
 
SRCEXT := cc
SRCTREE := $(shell find $(SRCDIR) -not -path '*/\.*' -type d)
BUILDTREE := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SRCTREE)/%)
SOURCES := $(shell find $(SRCDIR) -not -path '*/\.*' -type f -name "*.$(SRCEXT)")
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CXXFLAGS = -Wall -Wno-unused-function -Wno-sign-compare -g -O3
LIB = -lgmpxx -lgmp
INC := -I include

TARCMD := tar --exclude='*.swp' -cf
TARNAME := laboratory_$(shell date "+%Y-%m-%d-%H%M").tar
TARFILES := src include makefile *.cc

$(TARGET): $(OBJECTS)
	@echo " Linking..."
	@echo " $(CXX) $^ -o $(TARGET) $(LIB)"; $(CXX) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@echo $(BUILDTREE) | xargs mkdir -p
	@echo " $(CXX) $(CXXFLAGS) $(INC) -c -o $@ $<"; $(CXX) $(CXXFLAGS) $(INC) -c -o $@ $<

clean:
	@echo " Cleaning..."; 
	@echo " $(RM) -r $(BUILDDIR) $(TARGET)"; $(RM) -r $(BUILDDIR) $(TARGET)

tar:
	@echo " Tarring..."; 
	@echo " $(TARCMD) $(TARNAME) $(TARFILES)"; $(TARCMD) $(TARNAME) $(TARFILES)

.PHONY: clean
