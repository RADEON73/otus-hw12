.PHONY: all clean

# Определение операционной системы
ifeq ($(OS),Windows_NT)
    SYSTEM := WINDOWS
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        SYSTEM := LINUX
    else ifeq ($(UNAME_S),Darwin)
        SYSTEM := MACOS
    else
        SYSTEM := UNIX
    endif
endif

# Платформозависимые настройки
ifeq ($(SYSTEM),WINDOWS)
all: bin/mapper_avg.exe bin/reducer_avg.exe bin/mapper_var.exe bin/reducer_var.exe

bin/mapper_avg.exe: mapper_avg.cpp
	if not exist bin mkdir bin
	g++ -o $@ mapper_avg.cpp

bin/reducer_avg.exe: reducer_avg.cpp
	if not exist bin mkdir bin
	g++ -o $@ reducer_avg.cpp

bin/mapper_var.exe: mapper_var.cpp
	if not exist bin mkdir bin
	g++ -o $@ mapper_var.cpp

bin/reducer_var.exe: reducer_var.cpp
	if not exist bin mkdir bin
	g++ -o $@ reducer_var.cpp

clean:
	if exist bin rmdir /s /q bin
	if exist output_avg del output_avg
	if exist output_var del output_var
else
all: bin/mapper_avg bin/reducer_avg bin/mapper_var bin/reducer_var

bin/mapper_avg:
	mkdir -p bin
	g++ -o $@ mapper_avg.cpp

bin/reducer_avg:
	mkdir -p bin
	g++ -o $@ reducer_avg.cpp

bin/mapper_var:
	mkdir -p bin
	g++ -o $@ mapper_var.cpp

bin/reducer_var:
	mkdir -p bin
	g++ -o $@ reducer_var.cpp

clean:
	rm -rf bin output
endif