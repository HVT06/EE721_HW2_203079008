library ieee;
use ieee.std_logic_1164.all;

entity majority5_circu is
port(a_in  : in std_logic_vector(0 to 4);
	  a_out : out std_logic);
end majority5_circu;

architecture majority5_arch1 of majority5_circu is

begin
	a_out <= (a_in(0) or a_in(1) or a_in(2)) and (a_in(0) or a_in(1) or a_in(3)) and 
				(a_in(0) or a_in(1) or a_in(4)) and (a_in(0) or a_in(2) or a_in(3)) and
				(a_in(0) or a_in(2) or a_in(4)) and (a_in(0) or a_in(3) or a_in(4)) and
				(a_in(1) or a_in(2) or a_in(3)) and (a_in(1) or a_in(2) or a_in(4)) and
				(a_in(1) or a_in(3) or a_in(4)) and (a_in(2) or a_in(3) or a_in(4));

end majority5_arch1;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity majority5_circu_tb is
end majority5_circu_tb;

architecture tb of majority5_circu_tb is
	signal a_in_tb  : std_logic_vector(0 to 4) := (others => '0');
	signal a_out_tb : std_logic;
	
	begin
	
	UUT : entity work.majority5_circu port map(a_in => a_in_tb,a_out=> a_out_tb);
	
	
	stim_proc: process
	begin
		for i in 1 to 32 loop
			a_in_tb <= std_logic_vector(unsigned(a_in_tb)+1); wait for 50 ns;
		end loop;
		wait;
	end process;
	
end tb;
