# ابتدا(Ibtida) SoC - Google SKY130 Shuttle 
An Soc designed to be included inside the Caravel, a template SoC for Google SKY130 free shuttles. 

ابتدا means the start of something. This is a minimal SoC built around a RISC-V based 5 stage pipelined core Buraq-Mini. Both the SoC and the core are made from scratch using CHISEL HDL. The CHISEL source code as well as the emitted verilog are provided in the relvant folders. It is still Work In Progress (WIP). The current SoC architecture is given below.

<p align=”center”>
<img src="/doc/ibtida-soc.png" > 
</p>

## Design hierarchy

Chisel source code is available here:
```
chisel/
├── Buraq-Mini (core source)
│   │–– RV32i
│       └── src
│–– TileLink  (bus source)
│   └── src
└── src (SoC source)
```
The emitted verilog is present here:
```
verilog/
├── rtl
│   ├──ibtida-soc
│   │  └── Ibtida_top_dffram_cv.v
```
The synthesized netlist is present here:
```
verilog/
├── gl
│   └── Ibtida_top_dffram_cv.v
```
The hardened macros are placed here:
```
def/
└── Ibtida_top_dffram_cv.def.gz
```
```
lef/
└── Ibtida_top_dffram_cv.lef
```
```
gds/
└── Ibtida_top_dffram_cv.gds.gz
```
## Contributors
Main contributors are:
1. Engr. Muhammad Hadir Khan (RTL design based on CHISEL) (__Owner__).
2. Sajjad Ahmed              (RTL design based on CHISEL).
3. Engr. Aireen Amir Jalal  (APR flow with OpenLANE RTL-GDSII).

Other contributors:

4. Dr. Roomi Naqvi (Supervisor).
5. Dr. Ali Ahmed (Supervisor).
6. Usman Zain

