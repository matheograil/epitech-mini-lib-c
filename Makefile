##
## EPITECH PROJECT, 2023
## MiniLibC
## File description:
## MAKEFILE file.
##

# Source files
SRC = src/strlen.asm \
	src/strchr.asm \
	src/strrchr.asm \
	src/memset.asm \
	src/memcpy.asm \
	src/strcmp.asm \
	src/strcasecmp.asm \
	src/strncmp.asm \
	src/strpbrk.asm

# Object files
OBJ = $(SRC:.asm=.o)

# Output library name
NAME = libasm.so

# Output tests name
TESTS_NAME = unit_tests

# Method to compile the .asm files
$(OBJ):
	for asm in $(SRC); do \
		nasm -f elf64 $$asm; \
	done

# Method to compile the library
$(NAME): $(OBJ)
	ld -shared -o $(NAME) $(OBJ)

# Main method
all: $(NAME)

# Method to remove the .o files
clean:
	rm -f $(OBJ)

# Method to remove the library
fclean: clean
	rm -f $(NAME)

# Method to recompile the all project
re:	fclean all

# Method to test the library
tests_run: re
	gcc -lcriterion --coverage -o $(TESTS_NAME) $(OBJ) tests/*.c
	LD_PRELOAD=./$(NAME) ./unit_tests

# To avoid relinking
.PHONY: all clean fclean re
