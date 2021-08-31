library ieee;
use ieee.std_logic_1164.all ;

package decod_2to4b_package is
	component decod_2to4b
		port ( en : in std_logic;
				 a  : in std_logic_vector(1 downto 0);
				 b  : out std_logic_vector(3 downto 0) ) ;
	end component ;
	-- other declarations can be added too
end package ;
