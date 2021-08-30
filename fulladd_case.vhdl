library ieee;
use ieee.std_logic_1164.all;


entity fulladd_case is
port(A,B,Cin : in std_logic;
	  S,Cout: out std_logic);
end entity;

architecture fulladd_case_arch1 of fulladd_case is

begin
process(A,B,Cin)

variable dat: std_logic_vector(2 downto 0);
begin
	dat := A  & B & Cin;
case dat is
	when "000" => Cout <= '0'; S <= '0';
	when "001" => Cout <= '0'; S <= '1';
	when "010" => Cout <= '0'; S <= '1';
	when "011" => Cout <= '1'; S <= '0';
	when "100" => Cout <= '0'; S <= '1';
	when "101" => Cout <= '1'; S <= '0';
	when "110" => Cout <= '1'; S <= '0';
	when "111" => Cout <= '0'; S <= '1';
end case;
end process;

end architecture;

