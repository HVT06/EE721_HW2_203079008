library ieee;
use ieee.std_logic_1164.all;


entity case_xor is
port(x  : in std_logic_vector(1 downto 0);
	  xor_out : out std_logic);
end entity;

architecture case_xor_arch1 of case_xor is

begin
process(x)
begin
case x is
	when "00" => xor_out <= '0';
	when "01" => xor_out <= '1';
	when "10" => xor_out <= '1';
	when "11" => xor_out <= '0';
end case;
end process;

end architecture;

