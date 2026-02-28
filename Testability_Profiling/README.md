# Design for Testability (DFT) 
## 16-Input AND Tree – Testability Profiling and Test Point Insertion

## Project Overview

This project focuses on understanding how deep combinational logic affects testability. I implemented a 16-input AND tree in Verilog HDL and analyzed why such structures are difficult to test under random patterns.

The goal was to study controllability and observability issues and then improve the design using basic Design for Testability (DFT) techniques.

---

## Baseline Design

The circuit is a 16-input AND tree built using multiple layers of 2-input AND gates.

In this structure:

- The output becomes 1 only when all 16 inputs are 1  
- Probability of activation = (1/2)^16  
- Controllability of output (CC1) is very high  

During simulation, the output almost never becomes 1, clearly showing poor controllability and random-resistant behavior.

---

## Test Point Insertion (TPI)

To improve testability, I modified the design using two techniques:

### Control Point (CP)
A controllable signal was inserted midway in the tree.  
When enabled during test mode, it forces an internal node to logic 1, reducing dependency on upstream inputs and improving fault propagation.

### Observation Point (OP)
An internal node was routed to a separate output.  
This allows direct visibility of internal activity without being masked by deeper AND logic.

---

## Verification

A testbench applied 10,000+ random input patterns and measured:

- Output activation frequency  
- Internal node visibility  
- Impact of control point on propagation  

All results were observed in the console window.

---

## Key Outcome

- Baseline design shows extremely poor controllability  
- Internal nodes toggle but remain hidden without observation points  
- Control points significantly improve propagation of internal faults  

---

## What I Learned

Through this project, I developed practical intuition about:

- Why wide AND trees are hard to test  
- How logic depth affects controllability  
- How small DFT modifications improve fault coverage  

This helped me connect theoretical DFT concepts with real hardware behavior through simulation-based analysis.
