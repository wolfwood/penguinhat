module test;

import penguinhat;

import tango.io.Stdout;

extern(C) void init_virtio_module();
extern(C) void init_virtio_console_module();

int main(){
	Stdout("VirtIO\n");
	init_virtio_module();

	Stdout("\nVirtIO console\n");
	init_virtio_console_module();


	return 0;
}