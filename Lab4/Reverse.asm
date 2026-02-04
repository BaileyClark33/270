// Reverses an array of 6 elements in place
// Assumes array base address is in $r0

ANDI $r4 $r4 0 # $r4 = 0 
ADDI $r4 $r4 2 # $r4 = 2
ADD $r4 $r4 $r4 # $r4 = 4
ADDI $r5 $r4 1 # $r5 = 5

LW $r1 0($r0) # $r1 = A[0]
ADD $r3 $r5 $r0 # $r3 = 5 + $r0
LW $r2 0($r3) # $r2 = A[5]
SW $r2 0($r0) # A[0] = $r2
SW $r1 0($r3) # A[5] = $r1

LW $r1 1($r0) # $r1 = A[1]
ADD $r3 $r4 $r0 # $r3 = 4 + $r0
LW $r2 0($r3) # $r2 = A[4]
SW $r2 1($r0) # A[1] = $r2
SW $r1 0($r3) # A[4] = $r1

LW $r1 2($r0) # $r1 = A[2]
LW $r2 3($r0) # $r2 = A[3]
SW $r2 2($r0) # A[2] = $r2
SW $r1 3($r0) # A[3] = $r1
