library verilog;
use verilog.vl_types.all;
entity mod6 is
    port(
        clock           : in     vl_logic;
        reset_k         : in     vl_logic;
        Q               : out    vl_logic_vector(5 downto 0)
    );
end mod6;
