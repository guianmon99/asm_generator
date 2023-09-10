run:
	arm-none-eabi-as 001.asm -o test.o
	arm-none-eabi-gcc test.o -o test.elf -nostdlib
	qemu-arm ./test.elf
run2:
	arm-none-eabi-as  002.asm -o test.o
	arm-none-eabi-gcc -specs=nano.specs -specs=nosys.specs test.o -o test.elf 
	qemu-arm ./test.elf

run3:
	arm-none-eabi-as  001.s -o test.o
	arm-none-eabi-gcc -specs=nano.specs -specs=nosys.specs test.o -o test.elf 
	qemu-arm ./test.elf

generate_arm:
	arm-none-eabi-gcc -c -S 001.c

generate_rv: 
	riscv32-unknown-elf-gcc -c -S 001.c
clean: 
	rm *.o