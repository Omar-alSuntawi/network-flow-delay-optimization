# Network Flow and Delay Optimization

Final course project for Linear and Non-Linear Programming (MATH 404) modeling and optimizing traffic flow and travel delay across a 4-node, 5-road network using MATLAB (`linprog` and `fmincon`) and the Two-Phase Simplex Method.

## Overview

Consider a directed network of five roads ($X_1, X_2, X_3, X_4, X_5$) connecting four nodes, where $F$ vehicles enter and leave the network per minute. Each road has a fixed upper capacity

 $0 le X_1, X_3, X_5 le 10$
 $0 le X_2, X_4 le 30$

The project addresses two optimization problems

### 1. Network Flow Maximization (Linear Programming)
Maximize total throughput exiting the network subject to flow conservation and road capacities

$$max f = X_4 + X_5$$

Subject to
 $X_2 = X_3 + X_5$
 $X_4 = X_1 + X_3$
 $X_1 + X_2 = X_4 + X_5$
 $0 le X_1, X_3, X_5 le 10, quad 0 le X_2, X_4 le 30$

### 2. Network Delay Minimization (Non-Linear Programming)
Minimize total travel time across the network for a given traffic volume $F$ (e.g., $F = 5$ vehiclesmin), where each road's travel time increases nonlinearly as flow approaches capacity

$$min f(x) = t_{12}x_{12} + t_{13}x_{13} + t_{32}x_{32} + t_{24}x_{24} + t_{34}x_{34}$$

With travel time functions
 $t_{12} = 5 + dfrac{0.1 x_{12}}{1 - x_{12}10}$
 $t_{13} = dfrac{x_{13}}{1 - x_{13}30}$
 $t_{32} = 1 + dfrac{x_{32}}{1 - x_{32}10}$
 $t_{24} = dfrac{x_{24}}{1 - x_{24}30}$
 $t_{34} = 5 + dfrac{x_{34}}{1 - x_{34}10}$

## Key Results & Findings

 Maximum Network Flow (`linprog`) The optimal throughput is $f_{text{opt}} = 30$ vehiclesmin, achieved at
  $$X = [10, 20, 10, 20, 10]$$
 Capacity Sensitivity Analysis
   Roads 1, 3, and 5 are directly proportional to the optimal network flow (increasing their capacity directly increases $f_{text{opt}}$).
   Roads 2 and 4 (tested across capacities 20–40) do not affect the optimal network flow.
 Delay Minimization (`fmincon`) Formulated and solved as a nonlinearly constrained optimization problem with linear equality constraints, evaluating how optimal total delay scales with vehicle volume $F in [4, 8]$.

## Repository Structure

```text
network-flow-delay-optimization
├── README.md                                          # Project overview, formulations, and key results
├── mainCode.m                                         # MATLAB script for linprog flow optimization, sensitivity plots, and fmincon delay model
├── Network flow and delay optimization_report.pdf     # Full project report
├── Network flow and delay optimization_presentation.pdf # Project presentation slides (including Simplex tableaux)
```

## Usage in MATLAB

1. Open `mainCode.m` in MATLAB (requires the Optimization Toolbox for `linprog` and `fmincon`).
2. Run the script to compute the optimal flow and generate the 5-panel capacity sensitivity plots.
3. Uncomment Section `[2] Network delay problem` in `mainCode.m` to run the nonlinear delay optimization using `fmincon`.