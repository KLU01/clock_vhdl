--7 Segment Decoder
library ieee;
use ieee.std_logic_1164.all;

entity DisplayDec is
	port(BCD : in std_logic_vector (3 downto 0);
		  SEG : out std_logic_vector (6 downto 0));
end DisplayDec;

architecture arch of DisplayDec is
	begin
	process (BCD)
		begin			
		case BCD is
			when "0000" => SEG <= "0000001"; --0
			when "0001" =>	SEG <= "1001111"; --1
			when "0010"	=> SEG <= "0010010"; --2
			when "0011" => SEG <= "0000110"; --3
			when "0100" => SEG <= "1001100"; --4
			when "0101" => SEG <= "0100100"; --5
			when "0110" => SEG <= "1100000"; --6
			when "0111" => SEG <= "0001111"; --7
			when "1000" => SEG <= "0000000"; --8
			when "1001" => SEG <= "0001100"; --9
			when OTHERS => SEG <= "1111111";
		end case;
	end process;
end arch;