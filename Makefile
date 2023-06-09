#Compiler settings
CXX = g++
CXXFLAGS = -g -Wall -std=c++17
LDFLAGS = -lncurses

#Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin



#Create executable file
$(BINDIR)/network: $(OBJDIR)/Main.o $(OBJDIR)/Network.o $(OBJDIR)/Layer.o $(OBJDIR)/Node.o $(OBJDIR)/Edge.o $(OBJDIR)/DataPoint.o $(OBJDIR)/Colors.o $(OBJDIR)/Display.o $(OBJDIR)/DataParsing.o $(OBJDIR)/Prompt.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

#Create Main object file
$(OBJDIR)/Main.o: $(SRCDIR)/Main.c++ $(SRCDIR)/Main.h $(SRCDIR)//Data/Data.h
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@



#Create Network object file
$(OBJDIR)/Network.o: $(SRCDIR)/Network/Network.c++ $(SRCDIR)/Main.h 
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

#Create Layer object file
$(OBJDIR)/Layer.o: $(SRCDIR)/Network/Layer.c++ $(SRCDIR)/Main.h 
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

#Create Node object file
$(OBJDIR)/Node.o: $(SRCDIR)/Network/Node.c++ $(SRCDIR)/Main.h 
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

#Create Edge object file
$(OBJDIR)/Edge.o: $(SRCDIR)/Network/Edge.c++ $(SRCDIR)/Main.h 
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

#Create DataPoint object file
$(OBJDIR)/DataPoint.o: $(SRCDIR)/Network/DataPoint.c++ $(SRCDIR)/Main.h 
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@



#Create Colors object file
$(OBJDIR)/Colors.o: $(SRCDIR)/UserInterface/Colors.c++ $(SRCDIR)/Main.h 
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

#Create Display object file
$(OBJDIR)/Display.o: $(SRCDIR)/UserInterface/Display.c++ $(SRCDIR)/Main.h 
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

#Create Prompt object file
$(OBJDIR)/Prompt.o: $(SRCDIR)/UserInterface/Prompt.c++ $(SRCDIR)/Main.h $(SRCDIR)/Data/Data.h
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@



#Create DataParsing object file
$(OBJDIR)/DataParsing.o: $(SRCDIR)/Data/DataParsing.c++ $(SRCDIR)/Main.h $(SRCDIR)/Data/Data.h
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@

#Create SavedData object file
$(OBJDIR)/SavedData.o: $(SRCDIR)/Data/SavedData.c++ $(SRCDIR)/Main.h $(SRCDIR)/Data/Data.h
	$(CXX) $(CXXFLAGS) -I$(SRCDIR) -c $< -o $@



#Remove all execuable and object files
clean:
	rm -f $(OBJDIR)/*.o $(BINDIR)/network

#Run Main execuable file
exec: $(BINDIR)/network
	$(BINDIR)/network