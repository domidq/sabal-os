
ENTRY(_start)

PAGE_SIZE = 4K;

SECTIONS {
	_kernel_start = 2M;

	. = _kernel_start;

	.boot	: ALIGN(PAGE_SIZE) {
		*(.multiboot)
	}

	. += 0xC0000000;

	.text	: ALIGN(PAGE_SIZE) {
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

	_kernel_end = . - 0xC0000000;
}
