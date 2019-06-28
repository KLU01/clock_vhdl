# clock_vhdl

Experimenting with digital circuit design by creating 3 different types of clocks:
1. Modulo k counter
2. 3 bit bcd counter
3. ordinary time of day clock

The Altera DE2-70 board is utilized. 

The main purpose is to identify how to utilize the 50MHz clock to operate the clocks. 

## To run:
- Install any Quartus edition with support for Cyclone II devices. There is a free edition (might be called the web edition or subscription edition). ([quartus dl link](http://fpgasoftware.intel.com/13.0/?edition=subscription&download_manager=dlm3&platform=windows))
- Open the .qpf file (quartus project file)
- Set any file you would like to run to top priority and compile.
- If you want to load the design onto the fpga chip, connect the DE2-70 board, connect the pin assignments, compile, then run. 
