# ابتدا(Ibtida) SoC

ابتدا means the start of something. This is a minimal SoC built around a RISC-V based 5 stage pipelined core Buraq-Mini. Both the SoC and the core are made from scratch using CHISEL HDL. The CHISEL source code as well as the emitted verilog are provided in the relvant folders. It is still Work In Progress (WIP). The current SoC architecture is given below.

<p align=”center”>
<img src="/doc/ibtida-soc.png" > 
</p>

## Design hierarchy

Chisel source code is available here
```
chisel/
├── Buraq-Mini
│   │–– RV32i
│   │   │–– src
│   │   │   │–– main
│   │   │   │   │–– scala
|   |   |   |   |   └── core
```
## Contributors
Main contributors are:
1. Engr. Muhammad Hadir Khan (RTL design based on CHISEL)(Owner).
2. Sajjad Ahmed              (RTL design based on CHISEL).
3. Engr. Aireen Aamir Jalal  (APR flow with OpenLANE RTL-GDSII).


Other contributors:
1. Dr. Ali Ahmed (Supervisor).
2. Dr. Roomi Naqvi (Supervisor).
3. Engr. Farhan Ahmed Karim (Supervisor).
4. Engr. Asad Hussain Jaffri (Supervisor).
5. Zain Rizwan Khan
6. Hamza Shabbir
7. Uzair Khan
8. Wajeh
9. Usman Zain
10. Zeeshan
11. Waleed
