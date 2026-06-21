# Low-Power 8-Bit ALU Design Using VLSI Techniques

## Overview

This project presents the design and implementation of a Low-Power 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU performs various arithmetic and logical operations while minimizing power consumption through clock gating techniques.

## Features

* 8-bit ALU architecture
* Arithmetic operations: Addition and Subtraction
* Logical operations: AND, OR, XOR, NOT
* Shift operations: Left Shift and Right Shift
* Clock gating for low-power operation
* Carry and Zero flag generation

## Inputs

* `clk` : System clock
* `enable` : Enables/disables clock gating
* `reset` : Resets the ALU outputs
* `A[7:0]` : First 8-bit operand
* `B[7:0]` : Second 8-bit operand
* `opcode[2:0]` : Selects ALU operation

## Outputs

* `result[7:0]` : ALU output
* `carry` : Carry output for arithmetic operations
* `zero` : Indicates zero result

## Opcode Table

| Opcode | Operation   |
| ------ | ----------- |
| 000    | Addition    |
| 001    | Subtraction |
| 010    | AND         |
| 011    | OR          |
| 100    | XOR         |
| 101    | NOT         |
| 110    | Left Shift  |
| 111    | Right Shift |

## Power Optimization

Clock gating is employed to reduce dynamic power consumption by disabling unnecessary clock switching when the ALU is not in use.

## Simulation

The design is simulated using Xilinx ISE, Cadence Virtuoso, or Synopsys tools. Functional verification is performed through waveform analysis.

## Future Scope

* FPGA implementation
* CMOS transistor-level design
* Layout generation using Microwind or Magic VLSI
* Power and timing analysis

