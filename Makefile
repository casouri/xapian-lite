.POSIX:
PREFIX ?= /usr/local
CXX ?= g++
CXXFLAGS = -fPIC -I$(PREFIX)/include
LDFLAGS = -L$(PREFIX)/lib
LDLIBS = -lxapian

xapian-lite.so: xapian-lite.cc
	$(CXX) $< -o $@ -shared $(CXXFLAGS) $(LDFLAGS) $(LDLIBS)

xapian-lite.so.stdaln: xapian-lite.cc
	$(CXX) -o xapian-lite.so -shared $(CXXFLAGS) $< libxapian.a -lz

clean:
	rm -f *.so *.o
