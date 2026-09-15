# CPU Architecture

## Core Design

- 16-bit custom RISC CPU
- 8 general-purpose registers: R0-R7
- Each general-purpose register is 16 bits wide
- Register file target: 2 read ports, 1 write port
- 16-bit program counter
- 16-bit instruction register
- 16-bit instructions
- 16-bit address space
- Separate instruction and data memory
- Signed values use two's complement

## Status Flags

- Z: Zero
- N: Negative
- C: Carry / no-borrow behavior for subtraction
- V: Signed overflow

## Program Counter

- Normal instruction: PC = PC + 1
- Jump or branch: PC = target address or branch offset result

## Initial ISA

| Opcode | Instruction | Meaning |
| --- | --- | --- |
| `0000` | NOP | No operation |
| `0001` | ADD | Rd = Ra + Rb |
| `0010` | SUB | Rd = Ra - Rb |
| `0011` | AND | Rd = Ra AND Rb |
| `0100` | OR | Rd = Ra OR Rb |
| `0101` | XOR | Rd = Ra XOR Rb |
| `0110` | SHL | Shift left |
| `0111` | SHR | Shift right |
| `1000` | MOV | Copy register |
| `1001` | LDI | Load immediate |
| `1010` | LOAD | Load from memory |
| `1011` | STORE | Store to memory |
| `1100` | JMP | Unconditional jump |
| `1101` | BEQ | Branch if zero |
| `1110` | BNE | Branch if not zero |
| `1111` | HALT | Halt CPU |

## Current FPGA Target

Real Digital Boolean Board using the Xilinx Spartan-7 XC7S50-CSGA324-1.
