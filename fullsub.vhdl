library ieee;
use ieee.std_logic_1164.all ;

entity fullsub is 
  port ( Bin, x, y : in STD_LOGIC ;
         s, Bout : out STD_LOGIC ) ;
end entity ;
architecture LogicFunc of fullsub is
begin
  s <= x xor y xor Bin ;
  Bout <= ( not(x) and y ) or ( Bin and not(x) ) or ( Bin and y ) ; 																																																																																																																																																																																																																																																																																																																																												
end architecture ;
