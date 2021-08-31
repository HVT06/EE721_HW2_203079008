library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decod_2to4b is
	port(
	en : in std_logic;
	a  : in std_logic_vector(1 downto 0);
	b  : out std_logic_vector(3 downto 0)
	);
end entity;

architecture bhv_decod of decod_2to4b is

begin

process(a,en)
begin
	if (en='1') then
		b(0) <= a(0) or a(1) ;
		b(1) <= not a(0) or a(1);
		b(2) <= a(0) or not a(1);
		b(3) <= not a(0) or not a(1);
	else
		b <= "1111";
	end if;
end process;
end architecture ;
