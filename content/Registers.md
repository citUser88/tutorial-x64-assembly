# Registers

---

***A short introduction to registers, binary number system and backwards-compatibility***

----

## General Purpose Registers (GPRS)

-------

The x64 general purpose registers

- rAX, rBX, rCX, rDX, rBP, rSI, rDI, rSP, r8, r9, r10, r11, r12, r13, r14, r15

- 64-bit registers (mostly this is what you will work with in modern day x86 PCs (Linux, OSX and Windows)

- The storage format used in x86 architectures is little-endian

---------------------------------------------------------------------------------------------------------------

  - **MSB** Most significant bit
  - **LSB** Least significant bit


| 63   | ..32 | 31.. |    0 |
| ---- | ---- | ---- | ---- |
| MSB  |  ..  |  ..  |  LSB |

----------------------------------------------------------------------------------------------------------------

The 0 is a location and is the lowest bit in the register

Instruction set architecture manuals tend to indicate a range of bits as [hi:lo] [63:32], [31:0] to highlight the bit range they are informing the reader about. This is so the scheme is consistent with the order of how the information is stored on the processor.

The first 32-bits (LSB) portions of the 64-bit registers are accessible, easily by a slight rewording of the original labels

Aliases for accessing just the 32-bit portions (LSBs) of the 64-bit registers:

- EAX, EBX, ECX, EDX, EDI, ESI, EBP, ESP, R8D, R9D, R10D, R11D, R12D, R13D, R14D, R15D (D, for double word, 2 words, 4 bytes = 32 bits)

- Similarly, the first 16-bit and 8-bit portions of the (GPRs) are still accessible and backwards-compatibility of 8086 code is achieved, in some instances

- Accessing the 16-bit portions (LSBs) of the 32-bit portions of the 64-bit registers:

  AX, BX, CX, DX, DI, SI, BP, SP, R8W, R9W, R10W, R11W, R12W, R13W, R14W, R15W (W, for word, 1 word, 2 bytes = 16 bits)

- Accessing the low [7:0] 8-bit portions (LSBs) of the GPRs:

  AL, BL, CL, DL, SIL, DIL, BPL, SPL, R8B, R9B, R10B, R11B, R12B, R13B, R14B, R15B (B, for byte, 1 byte, 8 bits)

- Interestingly, enough, the hi-order 8-bit portions [15:0] of the (AX,BX,CX,DX) GPRs are still accessible (backwards compatibility):

  AH, BH, CH, DH

**NOTE:** For those wondering, the lower order accessing schemes access the same exact 64-bit registers' locations in the CPU, *not* a copy, or a different register altogether; they are union accessors.

---

## Segment Registers

------

- Legacy registers
- CS, FS, GS - Always available in all modes
- DS, ES, SS - Ignored by hardware in 64-bit mode

---

## BITS and Binary

---

***and why hexadecimal is convenient for computing***

---

Binarys is 1s and 0s, you most likely have a working knowledge of binary, radix 2, base 2, etc., for those uninitiated, a short journey through math pain land is in order

In binary there are 2 states, represented each by a 0 (zero), or, you guessed it! a 1 (one)

It is important to consider, what, exactly, in the registers / memory of the computer **ordered in little-endian format** means, also, that binary information represents an exponential form of 2 to the power of X at each bit location.  Conceptually, we start by looking at a string of 4 bits.  The higher order bits (larger exponents) start, from the left, and represent larger values indicated by 2 to the power of what bit place-holder location (if set to 1) the bit is located. Heading rightward, each placeholder bit represents a smaller X in 2^X...  So, 1001 means, the 4th bit the (MSB,left most bit) is on and so, that value 2^3=8.  The middle two are **off**, and, from left to right can represent the possibilities of 2^2=4, 2^1=2 (if set high).  The 0th bit at the very right is on and represents a 1.  So the biunary sequence **1001** represents the number 9 
$$
\begin{align*}
2^0 = 1 \\
2^1 = 2 \\
2^2 = 4  \\
2^3 = 8  \\
2^4 = 16 \\
2^5 = 32 \\
2^6 = 64 \\
2^7=128 \\
2^X -
where \ superscript \ X \ is \ the \ bit \ location
\end{align*}
$$
So, you may ask yourself, how do 8 bit locations account for 256 unique values?  

Well, in binary, for instance, the hexadecimal value **FFh**, where the suffix 'h' is used in assembler to indicate a hexadecimal value) is the value **255** in decimal. In binary, it is 8 individual 1s, stored in an 8-bit portion of memory. The high order portion (location 7, valued 128 in decimal) of the string of 1s starts at the left down to the lowest portion on the right **[7:0]** - a range 7th bit down to the 0th bit location) 

***Note:*** **MAKE = SET = ON = 1, in binary terms, BREAK = OFF = CLEAR = 0**

**1111 1111**, or **FF** in hex, So looking at the above table, each position represents the value of the calculated exponent. Then, just adding the values together, 1+2+4+8+16+32+64+128 = 255, but wait that's not 256 unique values?  It is, because 0 in itself is a unique value.  We are looking at unique values, 256 unique values,  In decimal this number is 255 unless you make a conceptual assumption that it is 256 by adding 1, then you don't have a 0 anymore, you have made it a 1 and all subsequent values +1.  Consider this, in future exercises.  This is a COUNT of unique values...

Look up binary / hex tables for more information on binary and hexadecimal... Pull your fancy calculator out and crunch some numbers. in base 16, 2 and shh, base 8 (OCTAL)..

Hexadecimal is a base 16 system.  It starts at 0 and has 16 unique values.
- 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F
- in decimal, the final letters would be (A=10, B=11, C=12, D=13, E=14, F=15)
- because the way computers work, 0 is a unique value and thus there are actually 16 **unique** values, represented by a single hexadecimal digit
- This is the reason why hexadecimal is so convenient. That it allows the 16 values each to be represented with a single symbol
- This makes a ton of sense once you work with hex and binary long enough, also, in time, this will become second nature for you

**LITTLE ENDIAN VS. BIG ENDIAN** - https://en.wikipedia.org/wiki/Endianness
---

##  rFLAG register

---

There is another 64-bit register, which is very important that requires a diligent and complete understanding, which will only fully develop, maybe, as more and more assembly code pours out of your tired and confused fingers....

Again, since x86 CPUS have had their 8-bit, 16-bit, 32-bit and now 64-bit days, onward, so has the FLAGS (originally) register.  At least, in all greatness, it hasn't changed much over these iterations, further functionalities are more advanced topics which can be mostly ignored by the applications designer employing pure assembler in their creations.

The flags register bits **[11:0]**, we are concerned with are more meaningful in terms of individual bits/flags.

| 11   | 10   | 9    | 8    | 7    | 6    | 5    | 4    | 3    | 2    | 1    | 0    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| OF   | DF   | xx   | xx   | SF   | ZF   | xx   | AF   | xx   | PF   | xx   | CF   |

- OF = Overflow Flag (status flag) Indicates the result of the last operation was too large to fit within the space of the register.  There are other caveats to this which will be discussed in the ***Instructions.md*** file
- DF = Direction Flag (control flag) direction string operations go when executing, no you can't make your code run backwards, although that would be pretty amazing
- SF = Sign Flag (status flag) This flag is used in indicating if a result of an operation is negative, or positive, this result is synonymous with 2s-compliment form of storing signed and unsigned values in binary format, a later topic.  This result can also be inferred by looking at the higher order bits of the signed/unsigned value stored, in the register.
- ZF = Zero Flag (status flag) this flag/bit will be **SET** if the result of a last operation is 0 or **CLEAR** for a non-zero result.  There are instructions which use this flag for control transfer and indicating test results.
- AF = Auxiliary Carry Flag (status flag) related to Carry Flag and (BCD) Binary Coded Decimal and arithemtic operations
- PF = Parity Flag (status flag) this flag is involved with bit parity checking, something which will be made clear in a later tutorial
- CF = Carry Flag (status flag)  indicates insights such as, last integer addition or subtraction carried or borrowed a bit during execution, some operations do not set this flag, and you may think they would, this is why I won't go to deep into this now.  Some operations (mostly LOGICAL) will always **CLEAR** this flag after execution

In summary, there are luckily, only seven different flags to really pay attention to in this 12 bit range of the **FLAGS** register. The only control flag, is the direction flag.  It is set to indicate how a STRING operation is performed, from end to start, or start to end.  These operations will be discussed in depth, in the ***Instructions.md***  file.  The six status flags indicate what happened following immediately after arithmetic and logic operations have executed.  Also, these 7 flag bits are not only ***readable***, but also, they **ALL** are **writable**.  They can be set or unset, explicitly.  Also, when conditional operations (such as control transfers using variants of the **JMP** instruction) are executed, they will look at different status flag bits to determine whether or not to transfer control to another location of the program, or, just continue on and not perform the control transfer.

---

## rIP instruction pointer register

---

This register indicates the address in memory of the next instruction in line to be executed.  The value stored in it is a **pointer** to an address in memory.  It has been called IP, EIP, RIP, etc...  Mostly, we will call it **IP**.  RIP, the IP.  When control transfer instructions are executed they will set (or decide to) this register. When the operation is finished, the program will begin execution at the start of the new location it has been set to.

