library verilog;
use verilog.vl_types.all;
entity mod6_vlg_check_tst is
    port(
        Q               : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end mod6_vlg_check_tst;
