
ENTRY(_start)

PAGE_SIZE = 4K;

SECTIONS {
	_kernel_start = 2M;

	. = 0xC0000000 + _kernel_start;

	.text	: ALIGN(PAGE_SIZE) {
		*(.multiboot)
		*(.text)
	}

	.rodata	: ALIGN(PAGE_SIZE) {
		*(.rodata)
	}

	.data	: ALIGN(PAGE_SIZE) {
		*(.data)
	}
    
	.bss	: ALIGN(PAGE_SIZE) {
		*(COMMON)
		*(.bss)
	}

	_kernel_end = .;
}
