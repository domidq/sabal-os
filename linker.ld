
ENTRY(_start)

PAGE_SIZE = 4096; /* 4KiB */

SECTIONS {
	. = 2M;

	_kernel_start = .;

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
