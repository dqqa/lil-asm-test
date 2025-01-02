AS := as
CC := gcc

app.exe: lib.o main.c
	$(CC) -s -Wall -Werror -Wextra -o $@ $^

lib.o: lib.S
	$(AS) --64 $^ -o $@

.PHONY: clean
clean:
	$(RM) -v ./*.o ./*.exe
