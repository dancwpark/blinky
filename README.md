# blinky

Getting started with learning VHDL.

I found that there is no good online resource for getting started (e.g., 
setting up your project, the steps to take to "compile" something, etc...).

This repository contains information on getting started on your VHDL \& FPGA
journey using the [NEXYS A7 100T](https://digilent.com/reference/programmable-logic/nexys-a7/start).


## Set-up

### FPGA Connection
The FPGA comes with a micro-usb to usb that connects your computer to the UART. Plugging it
in will power up the FPGA but no data can be sent. You must install the USB drivers from
Vivado (assuming you are using Xilinx). 

I was using Linux and found instructions [here](https://digilent.com/reference/programmable-logic/guides/install-cable-drivers).
As summary, run commands with the usb unplugged:
```bash
<Vivado Install>/data/xicom/cable_drivers/lin64/install_script/install_drvers/install_drivers
sudo adduser $USER dialout
```

It seems the instructions for Windows are:
```
    Disconnect the Xilinx USB cable. Alternatively, you can disabled the USB cable in the device manager first then re-enable them in step 5; in this case, you will not even need to reboot.
    Navigate to <Xilinx install>\bin\ [nt|nt64] or <Xilinx install>[nt|nt64] in an installed area.
    Run wdreg -inf windrvr6.inf install
    Run wdreg -inf xusbdrvr.inf install
    Connect the Xilinx USB cable.
```
These instructions are from [here](https://adaptivesupport.amd.com/s/article/54381?language=en_US).


### Constraint File
For the longest time, I did not know that you need a constraint file when programming for an actual board. 
The constraint file has the extension `.xdc` and describe what physical pins will be used by the HDL (e.g., Verilog, VHDL).
For example, in VHDL, you might have a signal for the LEDs as `LED : out STD_LOGIC_VEC(15 downto 0)`. Without the 
constraint file describing which pins LED points to, the 'compilation' will fail.

A better description of a constraint file can be found [here](https://digilent.com/reference/programmable-logic/guides/vivado-xdc-file).

For the NEXYS A7 100T, I got the constraint file from their [Github page](https://github.com/Digilent/Nexys-A7-100T-Keyboard/blob/master/src/constraints/Nexys-A7-100T-Master.xdc).


### Writing and Compiling
I'm still searching for a workflow that is comfortable for me. I find working within Vivado's GUI to be a bit
cumbersome. A web search led me to the possibility of using TCL to script the general workflow so that I
can work in terminal with (maybe) a headless instance of Vivado. I'll do more work to see how this is later.

Thankfully, the process for creating or importing files (source, constraints, etc...) is pretty intuitive within
the GUI. So getting started at this point was fairly straightforward. 

In general (I haven't seen otherwise), I take these steps after writing my VHDL.
```
1. Synthesize
2. Run Implementation
3. Generate Bitstream
4. (if not already) Connect Target
5. Program
```

I'm sure this workflow will change drastically when starting to undergo more complex designs.



