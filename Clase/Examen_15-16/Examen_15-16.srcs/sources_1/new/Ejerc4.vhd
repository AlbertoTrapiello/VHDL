library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity e1 is
 port (
 a: in std_logic;
 b: in std_logic;
 c: in std_logic;
 d: in std_logic_vector (3 downto 0);
 e: out std_logic_vector (3 downto 0)
 );
end e1;
architecture a1 of e1 is
 signal e_i: std_logic_vector(e'range);
begin
 process (a, b)
 begin
 if a = '0' then
 e_i <= (others => '0');
 elsif b'event and b = '1' then
 if c = '0' then
 e_i <= d;
 else
 e_i <= e_i(e_i'high - 1 downto 0) & e_i(e_i'high);
 end if;
 end if;
 end process;
 e <= e_i;
end a1;