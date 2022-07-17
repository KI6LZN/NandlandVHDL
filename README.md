# NandlandVHDL
Learning VHDL by following https://www.nandland.com/goboard/index.html

Notes to myself on how to use the FPGA (reference https://nandland.com/download-and-install-the-fpga-tools-and-drivers/):

Lattice Semi's iCEcube2 program is the IDE used to run the code through synthesis and implementation, and to create the bitgen. iCEcube2 is located in ~/lssc on my Ubuntu machine.

Lattice Semi's Diamond Programmer Standalone tool is used to write the bitgen from iCEcube2 onto the FPGA itself. The programmer program is located in usr/local/diamond and will run with the terminal command "diamond"
