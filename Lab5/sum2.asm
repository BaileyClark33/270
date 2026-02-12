#   sum2.asm	Bailey Clark 11 February 2026
#   Program to swap two elements in an array given the array and the indecies
#   Register use:
#	$t0: temporary storage for data to be summed
#	$t1: accumulates the sum

        .data                   # FYI: start of data section
num1:   .word   184             # three initial integer values
num2:   .word   -24
num3:   .word   -93
sum:    .space    4             # allocate a word for the integer result

        .text                   # FYI: start of code section
        .align 2                # FYI: align to start code on a word boundary
        .globl main             # FYI: make 'main' visible to the simulator
main:                           # main() {
        lw   $t0, num1          #    temp  = num1 
        add  $t1, $0, $t0       #    accum = temp
        lw   $t0, num2          #    temp  = num2
        add  $t1, $t1, $t0      #    accum = accum + temp
        lw   $t0, num3          #    temp  = num3
        add  $t1, $t1, $t0      #    accum = accum + temp
        sw   $t1, sum           #    sum   = accum
        addi $v0, $0, 1         #    $v0   = code for 'print-int'
        add  $a0, $0, $t1       #    $a0   = accum
        syscall                 #    syscall($v0=1) prints $a0
        jr   $ra                #    return control to the simulator
                                # }
