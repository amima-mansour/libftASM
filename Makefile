NAME = libfts.a
FLAGS = -Wall -Wextra -Werror
CC = gcc
NASM = nasm

PATH_SRCS = src
SRCS = 	$(addprefix $(PATH_SRCS)/, \
	ft_bzero.s \
	ft_strcat.s \
	ft_isalpha.s \
	ft_isdigit.s \
	ft_isalnum.s \
	ft_isascii.s \
	ft_isprint.s \
	ft_toupper.s \
	ft_tolower.s \
	ft_puts.s \
	ft_memcpy.s \
	ft_memset.s \
	ft_strlen.s \
	ft_memalloc.s \
	ft_strnew.s \
	ft_strcpy.s \
	ft_strdup.s \
	ft_strcmp.s \
	ft_strjoin.s \
	ft_atoi.s \
	ft_strchr.s \
	ft_cat.s)

PATH_OBJS = obj
OBJS = $(SRCS:$(PATH_SRCS)/%.s=$(PATH_OBJS)/%.o)

LIB_MAIN = tests/lib_main.c
LIB_MAIN_O = tests/lib_main.o
LIB_TEST = tests/lib_tests

all: $(NAME)

$(NAME): $(OBJS)
	@ar rc $@ $^
	@ranlib $@

$(PATH_OBJS)/%.o: $(PATH_SRCS)/%.s
	@mkdir -p $(PATH_OBJS)
	@$(NASM) -f macho64 $< -o $@

$(LIB_TEST): $(NAME) $(LIB_MAIN)
	@$(CC) $(FLAGS) -c $(LIB_MAIN) -o $(LIB_MAIN_O)
	@$(CC) $(FLAGS) $(LIB_MAIN_O) $(NAME) -o $@

test: $(NAME) $(LIB_TEST)
	@./$(LIB_TEST)

clean:
	@rm -rf $(PATH_OBJS) $(LIB_MAIN_O) $(CAT_MAIN_O)

fclean: clean
	@rm -rf $(NAME) $(LIB_TEST) $(CAT_TEST)

re: fclean all

.PHONY: all clean fclean re test
