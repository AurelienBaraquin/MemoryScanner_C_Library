##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## Makefile
##

CFLAGS += -O3 -W -Wall -Wextra
INCLUDE_FLAGS += -I./includes

OBJ_DIR = obj

SRC := $(shell find src -name "*.c")

OBJ := $(addprefix $(OBJ_DIR)/,$(notdir $(SRC:.cpp=.o)))

TARGET = SFE

.PHONY: all clean fclean re

all: $(TARGET)

$(OBJ_DIR)/%.o: src/%.cpp | $(OBJ_DIR)
	g++ $(INCLUDE_FLAGS) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(TARGET): $(OBJ)
	$(CC) -o $(TARGET) $^ $(CFLAGS) $(INCLUDE_FLAGS)

clean:
	$(RM) -r $(OBJ_DIR)

fclean: clean
	$(RM) $(TARGET)

re: fclean all