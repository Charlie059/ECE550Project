# ECE-550 Project Checkpoint 3
In this project, a 32-bit register file is constructed using Verilog.

## Authors:
Wenjun Zeng
netID: wz165

Xuhui Gong
netID: xg73

# 1. Descriptions:

## 1.1 Structure

The hierarchy of the main modules is as follows:

```
regfile
├─ write_port
│      └─ _5to32decoder
│           ├─ _3to8decoder
│           └─ _2to4decoder
├─ reg_32
│      └─dffe_ref
└─tristate_32
       └─ tristate
```

# 2. Module Design

## 2.1 32-bit register
The register file contains 32 32-bit registers. Each 32-bit register is made up of 32 D flip-flops as shown in the following figure:
### ![alt text](./32-reg.jpg?raw=true)
### 2.1.1 D Flip-Flop

The D flip-flop is built by referring to the provided behavioral Verilog code (dffe_ref.v).

## 2.2 Write port
The write port would select a specific register when the Write-Enable control input is on. The selected register will be enabled and accept write data.
The module takes 5-bit ctrl_writeReg and ctrl_writeEN as inputs, which specifies the write register and write enable status, respectively. its 32-bit outputs are connected to the EN nodes of the 32-bit registers.

The main functionality of the write port is realized by a 5-to-32 decoder, whose details can be found in the following section.


# 3. Decoder

In this project, we use one 2 to 4 decoder with enable and four 3 to 8 decoder with enable to build the 5 to 32 decoder (with enable but we set to always enable in case of future use). As shown in Figure below: 

![alt text](./5to32decoder.png?raw=true)

The design of the 2 to 4 decoder is shown in Figure below:

![alt text](./2_4_decoder.jpeg?raw=true)

And the design of 3 to 8 decoder is shown in Figure below:

![alt text](./3to8decode.png?raw=true)

# 4.  Tristate buffers

Tristate buffer based on the code provided by the checkpoint Instructions:

assign buffer_output = buffer_select ? output if true : 1’bz;

And we need to build a set of tristate buffers to compatible with 32 bits, so it has been written in the file named tristate_32.v.

# 5. Estimate register file can be clocked

In the design, we use the timing function of the waveform graph. We try to read and write the registers simultaneously in the same cycle. Note that since our write signal is not yet passed to the register at the first clock rising edge, we can only read the written value at the next clock signal. We try to keep increasing the clock frequency, we found that at about 16ns, the value of the read register is incorrect, so we estimate that the minimum period of the register operation is about 16ns.

