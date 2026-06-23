# 16-bit-PipelinedALU-Design
16 Bit Pipelined ALU design Description
## Project Overview

This project implements a 16-bit Arithmetic Logic Unit (ALU) in synthesizable Verilog HDL with a 2-stage pipelined architecture to improve operating frequency and throughput by reducing the critical path delay.

The design supports multiple arithmetic and logical operations and has been synthesized and analyzed using Intel Quartus Prime.

## Features
16-bit synthesizable Verilog HDL design
2-stage pipelined architecture
### Arithmetic operations
- Addition
- Subtraction
- Increment
- Decrement
### Logical operations
- AND
- OR
- XOR
- NOT
Improved throughput through pipelining
Static Timing Analysis (STA)
RTL simulation and synthesis
## Pipeline Architecture
### Stage 1
Input register
Operand capture
Operation decoding
### Stage 2
ALU computation
Output register

This pipelined implementation reduces the combinational delay, enabling higher clock frequencies compared to a non-pipelined ALU.

## Tools Used
- Verilog HDL
- Intel Quartus Prime
- TimeQuest Timing Analyzer

## Results
Successfully synthesized using Quartus Prime.
Reduced critical path delay using a 2-stage pipeline.
Improved maximum operating frequency compared to the non-pipelined design.
Verified functionality through simulation.
##Future Improvements
Increase pipeline depth for higher clock frequencies.
Add multiplication and shift operations.
Parameterize the ALU width (e.g., 8-bit, 16-bit, 32-bit, 64-bit).
Implement forwarding and hazard handling for processor integration.
##Author

Yuvaraj Dhayal D
