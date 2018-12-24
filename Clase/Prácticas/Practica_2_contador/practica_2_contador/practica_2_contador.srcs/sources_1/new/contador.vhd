------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 15.11.2018 17:10:41
---- Design Name: 
---- Module Name: contador - cont
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--LIBRARY ieee;
--USE ieee.std_logic_1164.ALL;
--USE ieee.std_logic_arith.ALL;
--USE ieee.std_logic_unsigned.ALL;
---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;


--entity contador is
--    Port (
--        rst: IN STD_LOGIC;
--        boton: IN STD_LOGIC;
--        code: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
--end contador;
--architecture cont of contador is
--SIGNAL c: SIGNED (code'RANGE);
--begin
--PROCESS(boton, rst)
--BEGIN
--    IF (rst = '0') THEN 
--        code <= (others => '0');
--    ELSE IF (boton'event AND boton = '1') THEN
--        c <= c + 1;
--    END IF;
-- END PROCESS;     
  
--code <= STD_LOGIC_VECTOR(c);        

--end cont;

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
elsif (boton'event and boton ='1') then
c <= c + 1;
end if;
end process;
code<=std_logic_vector (c);
end architecture;
