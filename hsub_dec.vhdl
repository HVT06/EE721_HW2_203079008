library ieee;
use ieee.std_logic_1164.all;
use work.decod_2to4b_package.all;


entity hsub_dec is
port(A,B: in std_logic;
	  S,Bout: out std_logic);
end entity;

architecture hsub_dec_arch1 of hsub_dec is
signal en: std_logic;
signal a1: std_logic_vector(1 downto 0);
signal a2: std_logic_vector(3 downto 0);

begin

UU1 : decod_2to4b port map ( en, a1, a2) ;

en <= '1';
a1 <= A & B;

S <= a2(0) and a2(3);
Bout <= (a2(0) and a2(2)) and ('1' and a2(3));


end architecture;
