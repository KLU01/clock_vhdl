library verilog;
use verilog.vl_types.all;
entity mod6_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        reset_k         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mod6_vlg_sample_tst;
