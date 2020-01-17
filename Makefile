# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aben-azz <aben-azz@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/02/03 09:24:41 by aben-azz          #+#    #+#              #
#    Updated: 2020/01/17 10:21:50 by aben-azz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOSTTYPE = $(shell env | grep HOSTTYPE | sed 's/HOSTTYPE=//g')
ifeq ($(HOSTTYPE),)
HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

NAME = malloc

LIB_NAME = libft_$(NAME)_$(HOSTTYPE).so
LINK_NAME = libft_$(NAME).so
#lft_name = libft.a

#lft_dir = ./libft/
src_dir = ./srcs/
inc_dir = ./includes/
#lft_inc_dir = $(lft_dir)includes/
obj_dir = ./obj/

#lft_lib = $(lft_dir)$(lft_name)

HEADER_FILES = $(inc_dir)malloc.h
#LIBHEAD = $(lft_inc_dir)libft.h
src_files = malloc.c free.c realloc.c

SRC = $(addprefix $(src_dir), $(src_files))
OBJ = $(addprefix $(obj_dir), $(src_files:.c=.o))
MSG				=	$(_BOLD)$(_BLUE)Compiling $(NAME):$(_END)
CC = gcc
CFLAGS = -Wall -Werror -Wextra -O3
AR = ar rcs
INC = -I $(inc_dir) #-I $(lft_inc_dir)
LONGEST			=	$(shell echo $(notdir $(SRC)) | tr " " "\n" | awk ' { if (\
				length > x ) { x = length; y = $$0 } }END{ print y }' | wc -c)
_END			=	\x1b[0m
_BOLD			=	\x1b[1m
_UNDER			=	\x1b[4m
_REV			=	\x1b[7m
_GREY			=	\x1b[30m
_RED			=	\x1b[31m
_GREEN			=	\x1b[32m
_YELLOW			=	\x1b[33m
_BLUE			=	\x1b[34m
_PURPLE			=	\x1b[35m
_CYAN			=	\x1b[36m
_WHITE			=	\x1b[37m
_IGREY			=	\x1b[40m
_IRED			=	\x1b[41m
_IGREEN			=	\x1b[42m
_IYELLOW		=	\x1b[43m
_IBLUE			=	\x1b[44m
_IPURPLE		=	\x1b[45m
_ICYAN			=	\x1b[46m
_IWHITE			=	\x1b[47m
_MAGENTA		=	\x1b[35m

all: $(NAME)

$(NAME): $(OBJ) $(LIBHEAD) $(HEADER_FILES)
	@echo "\r\033[K$(_BOLD)$(_PURPLE)Making $(NAME)...$(_END)"
	@$(AR) $(LIB_NAME) $(OBJ)
	@rm -rf $(LINK_NAME)
	@ln -s $(LIB_NAME) $(LINK_NAME)
	@echo "\r\033[K$(_BOLD)$(_GREEN)$(NAME) is ready for use$(_END)"

$(obj_dir)%.o: $(src_dir)%.c $(HEADER_FILES)
	@mkdir -p $(obj_dir)
	@$(CC) $(INC) $(CFLAGS) -o $@ $< -c
	@printf "\r\033[K$(MSG)$(_BOLD)$(_CYAN)%-$(LONGEST)s\$(_END)" $(notdir $<)

clean:
	@rm -rf $(obj_dir)
	@#make -C $(lft_dir) clean
	@echo "$(_BOLD)$(_RED)Successfuly removed all objects from $(NAME)$(_END)"

fclean: clean
	@rm -rf $(LIB_NAME) $(LINK_NAME)
	@#make -C $(lft_dir) fclean
	@echo "$(_BOLD)$(_RED)Successfuly removed ${NAME} from $(NAME)$(_END)"

re: fclean all

norm: clean
	@norminette $(src_dir) $(inc_dir)

allnorm: norm
	@norminette $(lft_dir)
	@norminette $(lui_dir)

main:
	@test -f $(LINK_NAME) || make
	@#test -f $(lft_dir)$(lft_name) || make -C $(lft_dir)
	@gcc main.c libft_malloc_x86_64_Darwin.so -I includes -o lol
