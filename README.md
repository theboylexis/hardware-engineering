# Hardware Engineering Lock-In

A hands-on hardware engineering learning and portfolio repository documenting my progression from digital logic and RTL design toward FPGA development, digital systems, and hardware engineering.

## Current Focus

* Digital logic design
* Verilog RTL
* RTL simulation and verification
* FPGA development
* Hardware/software interface
* Digital systems and computer architecture

## Repository Structure

```text
hardware-engineering/
└── digital-design/
    ├── full_adder/
    │   ├── full_adder.v
    │   └── tb_full_adder.v
    │
    ├── ripple_carry_adder/
    │   ├── ripple_adder_4bit.v
    │   └── tb_ripple_carry_adder_4bit.v
    │
    └── d_flip_flop/
        ├── d_flip_flop.v
        └── tb_d_flip_flop.v
```

## Projects

### Full Adder

A 1-bit full adder implemented in Verilog using combinational logic.

The design accepts:

* Two operand bits
* One carry-in bit

And produces:

* Sum
* Carry-out

The accompanying testbench verifies all possible input combinations.

### 4-bit Ripple-Carry Adder

A 4-bit adder constructed hierarchically from four verified full-adder modules.

The design demonstrates:

* Verilog module instantiation
* Hierarchical RTL design
* Internal carry propagation
* 4-bit buses
* Self-checking testbenches
* Exhaustive verification

The testbench checks all **512 possible input combinations** of two 4-bit operands and carry-in.

### D Flip-Flop

A positive-edge-triggered D flip-flop implemented using sequential Verilog RTL.

The design demonstrates:

* Sequential logic
* Clocked state updates
* Positive-edge triggering
* Nonblocking assignments
* State retention between clock edges

The self-checking testbench verifies that the output captures the input on rising clock edges and retains its previous value between edges.

**Verification result:** 3 tests passed, 0 failures.

## Verification Approach

Verification is treated as part of the design process rather than an afterthought.

Current projects use:

* Self-checking testbenches
* `$monitor` for simulation visibility
* Automated PASS/FAIL checks
* Exhaustive testing where practical
* Icarus Verilog simulation

The goal is to verify not only that a design produces the expected output, but also to understand why the RTL behaves that way.

## Tools

* Verilog
* Icarus Verilog
* Visual Studio Code
* Git / GitHub

## Roadmap

This repository will grow alongside the hardware engineering lock-in, progressing from fundamental RTL building blocks toward larger FPGA-based systems.

1. Sequential logic
2. Registers and counters
3. Finite-state machines
4. RTL design patterns
5. Verification and testbench development
6. Digital datapaths and control
7. FPGA architecture and implementation
8. Timing and constraints
9. Hardware debugging
10. Larger FPGA-based digital systems

## Philosophy

**Learn the fundamentals, build the hardware, verify the behavior, and understand why it works.**

This repository is a record of that process — from individual logic elements toward complete, verified digital systems.
