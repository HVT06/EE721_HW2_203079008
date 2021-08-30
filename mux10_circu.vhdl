library ieee;
use ieee.std_logic_1164.all;


entity mux10_circu is
port(I  : in std_logic_vector(0 to 9);
	  S  : in std_logic_vector(3 downto 0);
	  I_out : out std_logic);
end entity;

architecture mux10_arch1 of mux10_circu is


	signal mux2out : std_logic_vector(0 to 7);
	begin
	mux2out(0) <= (I(0) and not(S(0))) or (I(1) and S(0));
	mux2out(1) <= (I(2) and not(S(0))) or (I(3) and S(0));
	mux2out(2) <= (I(4) and not(S(0))) or (I(5) and S(0));
	mux2out(3) <= (I(6) and not(S(0))) or (I(7) and S(0));
	
	mux2out(4) <= (mux2out(0) and not(S(1))) or (mux2out(1) and S(1));
	mux2out(5) <= (mux2out(2) and not(S(1))) or (mux2out(3) and S(1));
	
	mux2out(6) <= (mux2out(4) and not(S(2))) or (mux2out(5) and S(2));
	mux2out(7) <= (I(8) and not(S(2))) or (I(9) and S(2));
	
	I_out <= (mux2out(6) and not(S(3)))or (mux2out(7) and S(3));
	
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux10_circu_tb is
end mux10_circu_tb;

architecture tb of mux10_circu_tb is
	signal I_tb : std_logic_vector(0 to 9) := (others => '0');
	signal S_tb : std_logic_vector(3 downto 0) := (others => '0');
	
	signal I_out_tb : std_logic;
	
	
	
	
	begin
	
	UUT : entity work.mux10_circu port map(I => I_tb,S => S_tb,I_out => I_out_tb);
	
	
	stim_proc: process
	begin
	   
		wait for 100 ps;
		for i in 0 to 9 loop
			I_tb(i) <= '1'; wait for 50 ps;
			
			
			I_tb(i) <= '0' ; wait for 50 ps;
			S_tb <= std_logic_vector(unsigned(S_tb)+1);
		end loop;
		wait;
	end process;
	
end tb;
