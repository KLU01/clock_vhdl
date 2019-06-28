library verilog;
use verilog.vl_types.all;
entity BCD_Counter3_vlg_check_tst is
    port(
        SEG0            : in     vl_logic_vector(6 downto 0);
        SEG1            : in     vl_logic_vector(6 downto 0);
        SEG2            : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end BCD_Counter3_vlg_check_tst;
