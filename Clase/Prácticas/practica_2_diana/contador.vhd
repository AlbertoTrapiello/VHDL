LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

Entity contador is
port ( rst: in std_logic;
boton: in std_logic;
code: out std_logic_vector (3 downto 0));
end entity;

Architecture cont of contador is
signal c: signed (code'range);
begin
process ( boton, rst)
begin
if (rst = '0') then
code <= (others=>'0');
elsif (boton'event and boton ='1')and(c < 10) then
c <= c + 1;
end if;

end process;
code<=std_logic_vector (c);
end architecture;