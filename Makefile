# Please see LICENSE for licensing information.


# --------- FLAGS AND VARIABLES --------------------

# CFLAGS, CC, and AR are exported by the root Makefile
HEADERPATH = -I./

# ---------  LIBALLOC BINARIES  --------------------

STATIC_1_0 = liballoc_1_0.a
STATIC_1_1 = liballoc_1_0.so
SHARED_1_0 = liballoc_1_1.a
SHARED_1_1 = liballoc_1_1.so

# ---------  GENERIC MAKE RULES --------------------

.PHONY: all static shared panix clean
all: $(STATIC_1_0) $(STATIC_1_1) $(SHARED_1_0) $(SHARED_1_1)
static: $(STATIC_1_0) $(STATIC_1_1)
shared: $(SHARED_1_0) $(SHARED_1_1)
panix: $(STATIC_1_0)

$(STATIC_1_0): liballoc.c
	@printf "$(COLOR_COM)(CC)$(COLOR_NONE)\t$@\n"
	@$(CC) $(HEADERPATH) $(CFLAGS) -static -c $<
	@printf "$(COLOR_COM)(AR)$(COLOR_NONE)\t$@\n"
	@$(AR) -rc $@ *.o

$(SHARED_1_0): liballoc.c
	@printf "$(COLOR_COM)(CC)$(COLOR_NONE)\t$@\n"
	@$(CC) $(HEADERPATH) $(CFLAGS) -shared $< -o $@

$(STATIC_1_1): liballoc_1_1.c
	@printf "$(COLOR_COM)(CC)$(COLOR_NONE)\t$@\n"
	@$(CC) $(HEADERPATH) $(CFLAGS) -static -c $<
	@printf "$(COLOR_COM)(AR)$(COLOR_NONE)\t$@\n"
	@$(AR) -rc $@ *.o

$(SHARED_1_1): liballoc_1_1.c
	@printf "$(COLOR_COM)(CC)$(COLOR_NONE)\t$@\n"
	@$(CC) $(HEADERPATH) $(CFLAGS) -shared $< -o $@

clean:
	@rm -f ./*.o
	@rm -f ./*.a
	@rm -f ./*.so
	@printf "$(COLOR_OK)Cleaned liballoc.$(COLOR_NONE)\n"
