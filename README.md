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
    ├── d_flip_flop/
    │   ├── d_flip_flop.v
    │   └── tb_d_flip_flop.v
    │
    ├── register_4bit/
    │   ├── register_4bit.v
    │   └── tb_register_4bit.v
    │
    └── counter_4bit/
        ├── counter_4bit.v
        └── tb_counter_4bit.v
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

### 4-bit Register

A 4-bit register implemented using four bits of sequential state.

The register demonstrates:

* Multi-bit sequential storage
* Positive-edge-triggered state updates
* Enable/load control
* Synchronous reset
* Reset priority over enable
* State retention
* Self-checking verification

When `enable` is asserted, the register captures the input data on the rising clock edge. When `enable` is deasserted, the register retains its previous value.

The register also includes a synchronous reset. When `reset` is asserted, the output is cleared to `0000` on the next rising clock edge.

**Verification result:** 2 tests passed, 0 failures.

### 4-bit Counter

A 4-bit synchronous up-counter implemented using sequential Verilog RTL.

The counter demonstrates:

* Clock-driven state updates
* Synchronous reset
* Incrementing sequential state
* Fixed-width binary arithmetic
* Overflow and wraparound behavior
* Self-checking testbench development

When `reset` is asserted, the counter is cleared to `0000` on the next rising clock edge. When reset is inactive, the counter increments by one on every rising edge.

Because the counter is 4 bits wide, it wraps from `1111` back to `0000` after the next increment.

The testbench verifies:

* Reset behavior
* First increment
* Second increment
* 4-bit wraparound

**Verification result:** 4 tests passed, 0 failures.

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

1. Sequential logic fundamentals
2. Registers, enables, resets, and counters
3. Shift registers
4. Finite-state machines
5. Timing fundamentals
6. RTL design patterns
7. Verification and testbench development
8. Digital datapaths and control
9. FPGA architecture and implementation
10. Timing and constraints
11. Hardware debugging
12. Larger FPGA-based digital systems

## Philosophy

**Learn the fundamentals, build the hardware, verify the behavior, and understand why it works.**

This repository is a record of that process; from individual logic elements toward complete, verified digital systems.
