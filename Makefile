SRC = 	strlen.s \
		strchr.s \
		strrchr.s \
		memset.s \
		memcpy.s \
		strcmp.s \
		memmove.s \
		strncmp.s \
		strcasecmp.s \
		strstr.s \
		strpbrk.s \
		strcspn.s \

TESTS = tests/strlen.c \
		tests/strchr.c \
		tests/strrchr.c \
		tests/memset.c \
		tests/memcpy.c \
		tests/strcmp.c \
		tests/memmove.c \
		tests/strncmp.c \
		tests/strcasecmp.c \

TARGET = libasm.so

OBJ = $(SRC:%.s=%.o)

TESTS_OUT = $(TESTS:%.c=%.test)

all: $(TARGET)

build: all

fclean: clean
	rm -f *.o *.gc*
	rm -f tests/*.test

clean:
	rm -f $(TARGET)

re: fclean build

$(TARGET): $(OBJ)
	ld -fPIC -shared -o $@ $^

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
