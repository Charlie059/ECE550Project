# ECE 550 Project Checkpoint 4: SimpleProcessor
In this project, a single cycle 32-bit processor is constructed using Verilog.
## Authors:
Wenjun Zeng
netID: wz165

Xuhui Gong
netID: xg73
## 1. Overview:
The schematic diagram of the processor is shown as follow:
![alt text](./circuit_diagram.png?raw=true)

The file hierarchy diagram of the project is given as follow. The processor in processor.v instantiates a program counter (PC), an ALU, and all control circuitry. The rest of the components, including the I-mem, register file, and D-mem are instantiated in the skeleton.

```
skeleton
├─ processor
│      ├─ pc
│      ├─ alu
|      ├─ sign_extension
│      └─ Control_flow
├─ imem
├─ regfile
├─ dmem
├─ clock_div_2
└─ clock_div_4
```
## 2. Control flow
This processor can implement 9 ISA instructions, each of which has different behavior. We therefore designed 10 control flow circuits to accomdate behaviors of different instructions. The tables of the control flow are given as follows: 
![alt text](./tb1.jpg?raw=true)
![alt text](./tb2.jpg?raw=true)

## 3. Clocks
The processor is operated under four clocks: imem_clock, dmem_clock, processor_clock, and regfile_clock, which are derived from a 50MHz master clock using clock dividers.
As shown in the following figure, the processor_clock and the regfile_clock divide the master clock's frequency by 4, the dmem_clock divides by 2 and the imem_clock is identical to the master clock.
![alt text](./clock.png?raw=true)