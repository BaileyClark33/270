#   swap.asm	Bailey Clark 11 February 2026
#   Elementary program to add three numbers and store and print the sum.
#   Register use:
#	$t0-$t6: temporary storage for data and array addresses

        .data                   # FYI: start of data section
ar:     .word -4, 9, 94, -45, 63, 2    # array of six values
ind1:   .word   3               # first index to swap
ind2:   .word   5               # second index to swap
sum:    .space    4             # allocate a word for the integer result

        .text                   # FYI: start of code section
        .align 2                # FYI: align to start code on a word boundary
        .globl main             # FYI: make 'main' visible to the simulator
main:                           # main() {
        la   $t0, ar            #    $t0 = &ar[0]
        lw   $t1, ind1          #    $t1 = ind1 
        sll  $t1, $t1, 2        #    $t1 = ind1 * 4
        add  $t2, $t0, $t1      #    $t2 = &ar[ind1]
        lw   $t3, ind2          #    $t3 = ind2 
        sll  $t3, $t3, 2        #    $t3 = ind2 * 4
        add  $t4, $t0, $t3      #    $t4 = &ar[ind2]
        lw   $t5, 0($t2)        #    $t5 = ar[ind1] 
        lw   $t6, 0($t4)        #    $t6 = ar[ind2] 
        sw   $t5, 0($t4)        #    ar[ind2] = $t5
        sw   $t6, 0($t2)        #    ar[ind1] = $t6
        syscall                 #    syscall($v0=1) prints $a0
        jr   $ra                #    return control to the simulator
                                # }
