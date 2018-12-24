library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity E1 is
 port (
 A : in std_logic;
 B : in std_logic;
 C : in std_logic;
 D : in std_logic_vector(3 downto 0);
 E : out std_logic_vector(3 downto 0)
 );
end E1;
architecture BEHAVIORAL of E1 is
begin
process (A,B,C,D) 
 subtype V_T is integer range 0 to 15;
 variable V: V_T;
 begin
 if A = '0' then
 V := 0;
 elsif B = '0' then
 V := to_integer(unsigned(D));
 elsif C'event and C = '1' then
 V := (V + 1) mod (V_T'high + 1);
 end if; 
 E <= std_logic_vector(to_unsigned(V, E'length)); 
 end process;
end BEHAVIORAL;
