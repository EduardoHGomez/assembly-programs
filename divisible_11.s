# Non-negative number divisible by 11
# Eduardo Gomez 10/03/2024

# The number to be checked should be in s0
# The result should be in s1
# Test cases, when it is -1, 0, 1, 5 etc.
# If the number is negative the result should be -1

.equ N 121 # Constant, it's our input value

.data
# We're not going to store the results (I believe, so it's not used)
# but for exercise 1, for example, I think it would be used
# if we're going to use data, then use lui and addi


.text

main:
    addi a0 zero N # Use the input value (N) and pass it as an argument

    # First check if it's negative
    addi t2 zero 0
    blt a0 t2 negative_input

    # Else: enter recursive case
    jal ra division

    # s registers: should retain the same value after exiting division

    # End of the program
    addi s0 zero N
    addi a7 zero 10
    ecall

    negative_input:
        addi s0 zero N
        addi s1 zero -1
        # End of the program
        addi a7 zero 10
        ecall


    division:
        # Stack frame
        # Save ra
        addi sp sp -4
        sw ra 0 sp

        # Pseudoinstruction li s0 5
        add s0 zero a0 # Assign s0 as a local variable

        # if a0 < 0 case when it's negative
        addi t0 zero 0 # Assign a temporary variable
        blt s0 t0 negative_case # Jump to negative_case if the condition is met

        # if a0 == 0 case where it's divisible
        beq s0 zero zero_case # Jump to zero_case if it's equal to zero

        # Recursive case, where it's not yet less than 0
        # so we keep subtracting 11. For example, if we had 5,
        # then we don't meet the conditions above, but keep
        # subtracting until we reach a negative number. So, it sums up
        # else
        addi a0 s0 -11 # a0 = s0 - 11
        jal ra division

        # After exiting recursion, go to end_division
        jal zero end_division


    zero_case:
        addi s1 zero 1 # Return 0 (success) meaning it's divisible
        jal zero end_division

    negative_case:
        addi s1 zero 0 # Return -1 if it's negative, as the instruction states
        jal zero end_division

    end_division:
        # Restore the stack frame
        lw ra 0 sp
        addi sp sp 4 # Return the 12 borrowed

        jalr zero ra 0 # Return to the entry value
