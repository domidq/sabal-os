
ENTRY(_start)

PAGE_SIZE = 4K;

SECTIONS {
	_kernel_start = 2M;

	. = _kernel_start;

	.multiboot : {
		*(.multiboot)
	}

	. += 0xC0000000;

	.text ALIGN(PAGE_SIZE) : AT(ADDR(.text) - 0xC0000000) {
		*(.text)
	}

	.rodata	ALIGN(PAGE_SIZE) : AT(ADDR(.rodata) - 0xC0000000) {
		*(.rodata)
	}

	.data ALIGN(PAGE_SIZE) : AT(ADDR(.data) - 0xC0000000) {
		*(.data)
	}
    
	.bss ALIGN(PAGE_SIZE) : AT(ADDR(.bss) - 0xC0000000) {
		*(COMMON)
		*(.bss)
	}

	_kernel_end = . - 0xC0000000;
}
