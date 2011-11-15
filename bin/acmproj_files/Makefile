# FILE: Makefile
# AUTHOR: sich_off

proj := $(shell basename `pwd`)

$(proj): $(proj).cpp
	g++ -Wall -o $(proj) $(proj).cpp;

run: $(proj)
	./$(proj) <in.txt;

clean:
	rm -f $(proj);

