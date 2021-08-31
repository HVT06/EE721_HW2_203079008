library ieee;
use ieee.std_logic_1164.all;


entity mult2 is
port(A,B : in std_logic_vector(1 downto 0);
	  mult: out std_logic_vector(3 downto 0));
end entity;

architecture mult2_arch1 of mult2 is

signal a1, a2, a3, ha1 : std_logic;

begin

mult(0) <= A(0) and B(0);
a1 <= A(1) and B(0);

a2 <= A(0) and B(1);
a3 <= A(1) and B(1);

mult(1) <= a1 xor a2;

ha1 <= a1 and a2;

mult(2) <= ha1 xor a3;

mult(3) <= ha1 and a3;

end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult2_tb is
end mult2_tb;

architecture tb of mult2_tb is
	signal A_tb, B_tb  : std_logic_vector(1 downto 0) := (others => '0');
	signal mult_tb : std_logic_vector(3 downto 0);
	
	signal flag : std_logic;
	
	begin
	
	UUT : entity work.mult2 port map(A => A_tb,B=> B_tb, mult=> mult_tb);
	
	
	stim_proc: process
	begin
		for i in 0 to 3 loop
			for i in 0 to 3 loop
				if(std_logic_vector(unsigned(A_tb)*unsigned(B_tb))= mult_tb) then
					flag <= '1';
				else flag <= '0';
			   end if;
			
				B_tb <= std_logic_vector(unsigned(B_tb)+1); wait for 50 ps;
			end loop;
			A_tb <= std_logic_vector(unsigned(A_tb)+1); wait for 50 ps;
		end loop;
		wait;
	end process;
	
end tb;
