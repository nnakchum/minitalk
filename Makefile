NAMEC = client
NAMES = server
BONUS_NAMEC = client_bonus
BONUS_NAMES = server_bonus
FT_PRINTF_DIR = ft_printf/
FT_PRINTF = libftprintf.a
SRC_DIR = src/

# Source files
SRCC_FILES = client.c
SRCS_FILES = server.c
BONUSC_FILES = client_bonus.c
BONUSS_FILES = server_bonus.c

# Add prefix for source directory
SRCC = $(addprefix $(SRC_DIR), $(SRCC_FILES))
SRCS = $(addprefix $(SRC_DIR), $(SRCS_FILES))
BONUSC = $(addprefix $(SRC_DIR), $(BONUSC_FILES))
BONUSS = $(addprefix $(SRC_DIR), $(BONUSS_FILES))

# Object files
OBJC = ${SRCC:.c=.o}
OBJS = ${SRCS:.c=.o}
OBJBC = ${BONUSC:.c=.o}
OBJBS = ${BONUSS:.c=.o}

CC = cc
CFLAGS = -Wall -Werror -Wextra
RM = rm -rf

all: $(NAMEC) $(NAMES)

$(NAMEC): $(OBJC)
	@make -C $(FT_PRINTF_DIR)
	$(CC) $(CFLAGS) $(OBJC) $(FT_PRINTF_DIR)$(FT_PRINTF) -o $(NAMEC)

$(NAMES): $(OBJS)
	@make -C $(FT_PRINTF_DIR)
	$(CC) $(CFLAGS) $(OBJS) $(FT_PRINTF_DIR)$(FT_PRINTF) -o $(NAMES)

bonus: $(BONUS_NAMEC) $(BONUS_NAMES)

$(BONUS_NAMEC): $(OBJBC)
	@make -C $(FT_PRINTF_DIR)
	$(CC) $(CFLAGS) $(OBJBC) $(FT_PRINTF_DIR)$(FT_PRINTF) -o $(BONUS_NAMEC)

$(BONUS_NAMES): $(OBJBS)
	@make -C $(FT_PRINTF_DIR)
	$(CC) $(CFLAGS) $(OBJBS) $(FT_PRINTF_DIR)$(FT_PRINTF) -o $(BONUS_NAMES)

clean:
	@make clean -C $(FT_PRINTF_DIR)
	$(RM) $(OBJC) $(OBJS) $(OBJBC) $(OBJBS)

fclean: clean
	@make fclean -C $(FT_PRINTF_DIR)
	$(RM) $(NAMEC) $(NAMES) $(BONUS_NAMEC) $(BONUS_NAMES)

re: fclean all

.PHONY: all bonus clean fclean re