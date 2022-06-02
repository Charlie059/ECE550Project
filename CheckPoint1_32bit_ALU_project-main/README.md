# ECE 550 Proeject checkpoint 1
Construct the arithmatic portion (add and substract) of a 32-bit ALU using Verilog HDL

## Authors:
Wenjun Zeng
netID: wz165

Xuhui Gong
netID: xg73

# 1. Descriptions:

## 1.1 Structure



The module main structure is like following:

```
alu
└─ ArithmeticOperator
       ├─ ADD_SUB_EN
       │    └─ AND_GATE_4
       ├─ ADD_SUB_OP
       │    ├─ MUX_2to1_32B
       │    └─ NOT_32
       ├─ Carry_select_adder
       │    ├─ Mux_36to18
       │    └─ carry_select_adder_16
       │           ├─ Mux_10to5
       │           ├─ Mux_12to6
       │           ├─ Mux_6to3
       │           ├─ Mux_8to4
       │           ├─ full_adder_1
       │           ├─ ripple_adder_2
       │           ├─ ripple_adder_3
       │           ├─ ripple_adder_4
       │           └─ ripple_adder_5
       ├─ isNotEqual
       │    └─ OR_32
       │           └─ OR_8
       ├─ islessthan
       │    └─ AND_3
       └─ overflow
```


# ![Screenshot 2021-09-13 at 18.15.49](https://github.com/Charlie059/32bit_ALU_project/blob/main/PNG%20image-62C15B75F39A-1.png?raw=true)


# 2. Module

## 2.1 ADD_SUB_EN

Consider the condition that the CSA performs addition and subtraction operations only if the [4:1] of the five-bit opcode is 0000. So we design an enable, i.e. we receive the [4:1] bits of the Op Code, and use NAND Gate to achieve EN high only when the 4:1 bits of the OP code are 0.

EN and Result get the final output by AND gate (If EN is low, it means that the result of the output is always low). In the same way, Overflow, isnotequal and islessthan are also controlled by EN.



## 2.2 ADD_SUB_OP

We determine addition and subtraction by accepting the LSB of the OP code (note that because we introduced EN, we don't need to worry about non-additive and subtractive instructions generating output). We use 2 to 1-MUX to control whether to output B or the inverse of B: when the LSB of the OP Code is 0, we pick B and access the CSA's Cin port with the same LSB as the OP Code (0); when the LSB of the OP Code is 1, we pick the inverse of B and access the CSA's Cin port with the same LSB as the OP Code (1);



## 2.3 32-bit Carry Select Adder(CSA)

The 32-bit Carry Select Adder(CSA) consists three 16-bit CSA and a 36-to-18 multiplexer.

 The 16-bit CSA is constructed using three 2-bit ripple carry adders (RCA), two 3-bit RCAs, two 4-bit RCAs, two 5-bit RCAs and several multiplexers with various sizes.
The first 2-bit RCAs is used to take the carry_in of the entire 16-bit CSA. While for the other RCAs, every two adders of the same size are connected in parallel and form a block. Each adder in the same block takes a different carry-in (0 or 1) and produce a sum and a carry out (c_out) respectively. The final results (sum and c_out) are selected by the c_out from previous block. 
The schematic of the 16-bit CSA is shown in the following diagram.

![alt text](./16-bit_CSA.png?raw=true)

The schematic of the 32-bit CSA is shown as follow. As can be seen from the diagram, the first 16-bit sum is directedly calculated from the first 16-bit CSA on the right. The last 16-bit result is selected based on the c-out of the previous CSA. In addition, two more carry bits, namely the carry-in and carry-out of the last digit (31), are also selected from the two CSAs on the left, which will be used to idetify whether the operation is overflow.

![alt text](./32-bit_CSA.png?raw=true)

## 2.4 isNotEqual

By using the truth table we know that the condition of isnotequal is:

OR(result[31:0]) AND (Opcode[0]) AND (EN)



## 2.5 isLessThan

By using the truth table we know that the condition of isLessThan is:

(result[31] XOR overflow) AND (EN) AND (Op[0])



## 2.6 Overflow

By using the truth table we know that the condition of Overflow is:

C_out[31] XOR C_in[31]













