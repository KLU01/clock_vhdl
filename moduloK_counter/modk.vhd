library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity modk is
	generic(k : natural := 4);
	port(clock, reset_k : in std_logic;
		  Q : out std_logic_vector(k-1 downto 0));
end modk;

architecture arch of modk is
	signal v : std_logic_vector(k-1  downto  0); 
	signal kn : std_logic;
	
	begin 
	process(clock, reset_k)  
		begin            
			if (reset_k = '0') then 
				 v <= (others => '0'); 
			elsif rising_edge(clock) then 
				if v = k-1 then v <= (others => '0');
				else v <= v + 1;
				end if;
			end if; 
	end process;
	Q <= v; 

end arch;