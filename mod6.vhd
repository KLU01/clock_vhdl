library ieee;
use ieee.std_logic_1164.all;

entity mod6 is
	port(clock, reset_k : in std_logic;
		  Q : out std_logic_vector(5 downto 0));
end mod6;

architecture arch of mod6 is
	
	component modk
		generic(k : natural := 4);
		port(clock, reset_k : in std_logic;
			  Q : out std_logic_vector(k-1 downto 0));
	end component;
	
	begin
	bit6 : modk 
		generic map(k => 6)
		port map(clock, reset_k, Q);
	
end arch;
