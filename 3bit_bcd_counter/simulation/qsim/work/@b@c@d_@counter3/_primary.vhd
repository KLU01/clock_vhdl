library verilog;
use verilog.vl_types.all;
entity BCD_Counter3 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        SEG0            : out    vl_logic_vector(6 downto 0);
        SEG1            : out    vl_logic_vector(6 downto 0);
        SEG2            : out    vl_logic_vector(6 downto 0)
    );
end BCD_Counter3;
