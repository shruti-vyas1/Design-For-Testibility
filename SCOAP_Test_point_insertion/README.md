# DFT 
##  About This Experiment

This repository contains my implementation of a **Design for Testability (DFT) profiling experiment** focused on analyzing hard-to-test combinational logic and improving fault observability using **Test Point Insertion (TPI)**.

The design simulates a logic cone where deep comparator structures create low-probability observability paths, making internal fault detection difficult under random testing.

---

## Objectives

- Implement a deep combinational comparator logic cone.
- Perform manual testability profiling using probabilistic observability reasoning.
- Insert Control Points (CP) and Observation Points (OP) to improve fault visibility.
- Compare baseline design with test-point-enhanced design.

---

## Design Idea

### Baseline Design

- Three-stage equality comparator chain.
- Output depends on simultaneous satisfaction of:
  - `A == B`
  - `C == D`
  - `E == F`

Due to AND gating, observing faults in deeper logic stages is statistically difficult.

### TPI Modified Design

- **Control Points** are used to activate test mode logic and remove side-input blocking during testing.
- **Observation Points** provide direct visibility into internal comparator nodes.

This demonstrates how practical DFT techniques improve test coverage.

---

## Result Verification Method

The experiment verifies improvement using statistical simulation.

- 1000 random input vectors are applied in two phases.

### Phase 1 — Baseline Testing

- Test mode is disabled.
- Output toggle frequency is measured.

### Phase 2 — Test Mode Enabled

- Control points are activated.
- Random vectors are applied again.

### Success Criterion

The design is considered improved if:
Toggle_Count_TPI > 10 × Toggle_Count_Baseline

This heuristic demonstrates enhanced fault observability in test mode.

