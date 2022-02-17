## makefile du pauvre

SRC = 	strlen.s \
		strchr.s \
		strrchr.s \
		memset.s

TESTS = tests/strlen.c \
		tests/strchr.c \
		tests/strrchr.c \
		tests/memset.c

TARGET = minilibc.so

OBJ = $(SRC:%.s=%.o)

TESTS_OUT = $(TESTS:%.c=%.test)

build: $(TARGET)

clean:
	rm -f *.o *.gc*
	rm -f tests/*.test

re: clean build

$(TARGET): $(OBJ)
	gcc -fPIC -shared -o $@ $^

%.o: %.s
	nasm -felf64 -o $@ $<

%.test: %.c
	@echo "---------------------"
	@echo "Compiling $<..."
	gcc -g -fPIC -o $@ $< -ldl --coverage
	@cp $@ $@.fail
	@echo "Running $<..."
	@./$@
	@rm $@.fail

tests_run: re $(TESTS_OUT)
