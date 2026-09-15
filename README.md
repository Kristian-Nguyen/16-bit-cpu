# 16-Bit CPU

A custom 16-bit RISC CPU built in SystemVerilog and targeted for the Real Digital Boolean Board (Xilinx Spartan-7).

## Project Goal

Design, simulate, verify, and deploy a working 16-bit processor that can execute a small custom instruction set including arithmetic, logic, memory, and branch operations.

## Current Progress

**35% complete**

Completed:
- CPU architecture and ISA planning
- 16-bit ALU
- ALU behavioral simulation and verification
- 8 x 16-bit register file
- Register file behavioral simulation and verification

Next milestone:
- 16-bit program counter

## Planned CPU Architecture

- 16-bit datapath
- 8 general-purpose 16-bit registers (R0-R7)
- 16-bit program counter
- 16-bit instruction register
- Zero, Negative, Carry, and Overflow flags
- Separate instruction and data memory
- Custom 16-instruction ISA

## ALU Operations

| ALU Select | Operation |
| --- | --- |
| `000` | ADD |
| `001` | SUB |
| `010` | AND |
| `011` | OR |
| `100` | XOR |
| `101` | Shift Left |
| `110` | Shift Right |
| `111` | Unused |

## Repository Structure

```text
src/            SystemVerilog design modules
simulation/     SystemVerilog testbenches
constraints/    FPGA constraint files
docs/           Architecture and design notes
```

## Hardware / Tools

- AMD/Xilinx Vivado
- Real Digital Boolean Board
- Xilinx Spartan-7 XC7S50-CSGA324-1
- SystemVerilog

## Target Completion

October 5, 2026, with October 6-8 reserved for debugging, documentation, and portfolio polish.
