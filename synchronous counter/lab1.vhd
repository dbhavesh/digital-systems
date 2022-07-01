library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lab1 is
	Port ( 
		clk 			: in std_logic;
		countbytwo 	: in std_logic;
		rst 			: in std_logic;
		enable 		: in std_logic;
		max_count 	: in std_logic_vector(15 downto 0);
		output 		: out std_logic_vector(15 downto 0)
	);
end lab1;

architecture arch of lab1 is 
signal count : integer range 0 to 65535;
begin
	process(clk,rst)
		variable max_count_2 : integer range 0 to 65535;
	begin
		max_count_2 := to_integer(unsigned(max_count));
		if rst = '0' then
			count <= 0;
		elsif rising_edge(clk) then
			if enable = '1' then
				if countbytwo = '1' then
					count <= count + 2; 
				else 
					count <= count + 1;
				end if;
			end if;
		end if;
		output <= std_logic_vector(to_unsigned(count, output'length));
	end process;				
end arch;