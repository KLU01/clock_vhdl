library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;


entity Clock is
	port(clk : in std_logic;	--50 MHz clock
		  reset : in std_logic;
		  s : in std_logic_vector(2 downto 0); --speed control
		  --output 7 segment values
		  SEG_c0, SEG_c1, SEG_s0, SEG_s1, SEG_m0, SEG_m1, 
		  SEG_h0, SEG_h1 : out std_logic_vector(6 downto 0));
end Clock;

architecture arch of Clock is
	component DisplayDec
		port(BCD : in std_logic_vector(3 downto 0);
			  SEG : out std_logic_vector(6 downto 0));
	end component;
	
	type state is (Normal, OneFifth, OneTenth, Sixty, Fastest);
	signal P : state; --P for present state
	signal speed : natural := 0;
	
	signal clock : natural := 0;
	signal c_0, c_1 : std_logic_vector(3 downto 0); --centiseconds
	signal s_0, s_1 : std_logic_vector(3 downto 0); --seconds
	signal m_0, m_1 : std_logic_vector(3 downto 0); --minutes
	signal h_0, h_1 : std_logic_vector(3 downto 0); --hours
	
	begin
	--speed
	process(s)
		begin
		case s is
			when "000" => P <= Normal; 
			when "001" => P <= OneFifth; 
			when "010" => P <= OneTenth; 
			when "011" => P <= Sixty; 
			when "100" => P <= Fastest;
			when OTHERS => P <= Normal;
		end case;
	end process;
	
	process(P)
		begin
		case P is
			when Normal => speed <= 500000; 
			when OneFifth => speed <= 25000000; 
			when OneTenth => speed <= 5000000; 
			when Sixty => speed <= 8333; 
			when Fastest => speed <= 1; 
		end case;
	end process;
	
	--clock
	process(clk, clock, reset)
		begin
			if(reset = '0') then clock <= 0; 
				c_0 <= "0000"; c_1 <= "0000"; 
				s_0 <= "0000"; s_1 <= "0000";
				m_0 <= "0000"; m_1 <= "0000";
				h_0 <= "0000"; h_1 <= "0000";
			elsif(reset = '1' and rising_edge(clk)) then clock <= clock + 1;
				
				if(clock = speed) then c_0 <= c_0 + 1;
				elsif(clock > speed) then clock <= 0; 
				end if;
				
				if(c_0 = "1010") then c_0 <= "0000"; c_1 <= c_1 + 1; --centiseconds_0 0-9 		
				end if;
				
				if(c_1 = "1010") then c_1 <= "0000"; s_0 <= s_0 + 1; --centiseconds_1 0-9 		
				end if;
				
				if(s_0 = "1010") then s_0 <= "0000"; s_1 <= s_1 + 1; --seconds_0 0-9
				end if;
				
				if(s_1 = "0110") then s_1 <= "0000"; m_0 <= m_0 + 1; --seconds_1 0-5
				end if;
				
				if(m_0 = "1010") then m_0 <= "0000"; m_1 <= m_1 + 1; --minutes_0 0-9
				end if;
				
				if(m_1 = "0110") then m_1 <= "0000"; h_0 <= h_0 + 1; --minutes_1 0-5
				end if;
				
				if((h_1 = "0000" or h_1 = "0001") and h_0 = "0110") 
									  then h_0 <= "0000"; h_1 <= h_1 + 1; --hours_0 0-9
				elsif(h_1 = "0010" and h_0 = "0100") 
									  then h_0 <= "0000"; h_1 <= h_1 + 1; --hours_0 0-3
				end if;
					
				if(h_1 = "0011") then h_1 <= "0000"; --hours_1 0-2
				end if;
			end if;	
	end process;
	
	--7 segment display
	centisecond0 : DisplayDec
		port map(c_0, SEG_c0);
	centisecond1 : DisplayDec
		port map(c_1, SEG_c1);
	
	second0 : DisplayDec
		port map(s_0, SEG_s0);	
	second1 : DisplayDec
		port map(s_1, SEG_s1);
		
	minute0 : DisplayDec
		port map(m_0, SEG_m0);	
	minute1 : DisplayDec
		port map(m_1, SEG_m1);
	
	hour0 : DisplayDec
		port map(h_0, SEG_h0);	
	hour1 : DisplayDec
		port map(h_1, SEG_h1);
		  
end arch;