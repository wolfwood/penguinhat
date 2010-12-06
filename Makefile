LDFLAGS=-L../../../user/c/lib  -lsyscall -lmindrt
all:
	x86_64-pc-xomb-gcc -T../../../user/c/flat.ld -o chel -static hello.c ${LDFLAGS}
	cp chel ../../../build/iso/binaries

tango:
	ldc -of foo test.d penguinhat.d  ../../runtimes/mindrt/util.d  -d-version=TANGO virtio.o
