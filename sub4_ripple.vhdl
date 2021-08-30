library ieee ;
use ieee.std_logic_1164.all ;
use work.fullsub_package.all ;

entity sub4_ripple is
	port ( Bin : in std_logic ;
			 x : in std_logic_vector(3 downto 0);
			 y : in std_logic_vector(3 downto 0);
			 s : out std_logic_vector(3 downto 0);
					Bout : out std_logic) ;
end entity ;
architecture structure of 	sub4_ripple is
	signal B1, B2, B3 : std_logic ;

begin
	stage0 : fullsub port map ( Bin, x(0), y(0), s(0), B1 ) ;
	stage1 : fullsub port map ( B1 , x(1), y(1), s(1), B2 ) ;
	stage2 : fullsub port map ( B2 , x(2), y(2), s(2), B3 ) ;
	stage3 : fullsub port map ( Bin=>B3 , Bout=>Bout , x=>x(3), y=>y(3), s=>s(3) );
	
	
end architecture ;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sub4_ripple_tb is
end sub4_ripple_tb;

architecture tb of sub4_ripple_tb is
	signal x_tb,y_tb : std_logic_vector(3 downto 0) := (others => '0');
	signal Bin_tb : std_logic;
	
	signal s_tb : std_logic_vector(3 downto 0);
	signal Bout_tb : std_logic; 
	signal flag : std_logic;
	signal Bflag : std_logic;
	
	begin
	
	UUT : entity work.sub4_ripple port map(Bin => Bin_tb,x => x_tb,y => y_tb,s=>s_tb,Bout=>Bout_tb);
	
	
	stim_proc: process
	begin
		Bin_tb <= '0'; wait for 25 ps;
		for i in 1 to 16 loop
			for i in 1 to 16 loop
				
				y_tb <= std_logic_vector(unsigned(y_tb)+1); wait for 50 ps;
				if(std_logic_vector(unsigned(x_tb)-unsigned(y_tb))= s_tb) then
					flag <= '1';
					if(((y_tb > x_tb) and (Bout_tb='1') )or ((x_tb > y_tb) and (Bout_tb='0')) or (x_tb = y_tb)) then
						Bflag <= '1';
					else Bflag <= '0';
					end if;
				else flag <= '0';
				end if;
			end loop;
			x_tb <= std_logic_vector(unsigned(x_tb)+1); wait for 50 ps;
		end loop;
		wait;
	end process;
	
end tb;
