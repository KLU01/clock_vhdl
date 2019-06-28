library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;


entity BCD_Counter3 is
	port(clk : in std_logic;	--50 MHz clock
		  reset : in std_logic;
		  SEG0, SEG1, SEG2 : out std_logic_vector(6 downto 0));
end BCD_Counter3;

architecture arch of BCD_Counter3 is
	component DisplayDec
		port(BCD : in std_logic_vector (3 downto 0);
			  SEG : out std_logic_vector (6 downto 0));
	end component;
	
	signal clock : natural := 0;
	signal val0, val1, val2 : std_logic_vector(3 downto 0);

	begin
	process(clk, clock, reset)
		begin
			if (reset = '0') then clock <= 0; val0 <= "0000"; val1 <= "0000"; val2 <= "0000";
			elsif(reset = '1' and rising_edge(clk)) then clock <= clock + 1;
				
				if(clock = 0) then val0 <= "0000";
				elsif(clock = 50000000 or clock = 100000000 or clock = 150000000 
					or clock = 200000000  or clock = 250000000 or clock = 300000000 
					or clock = 350000000 or clock = 400000000 or clock = 450000000 
					or clock = 500000000) then val0 <= val0 + 1;
				elsif(clock > 500000000) then clock <= 0; val1 <= val1 + 1; 
				end if;
				
				if(val1 = "1010") then val1 <= "0000"; val2 <= val2 + 1; 		
				end if;
				
				if(val2 = "1010") then val2 <= "0000";
				end if;
				
			end if;
	end process;
	
	small : DisplayDec
		port map(val0, SEG0);
	medium : DisplayDec
		port map(val1, SEG1);
	large : DisplayDec
		port map(val2, SEG2);
		
end arch;