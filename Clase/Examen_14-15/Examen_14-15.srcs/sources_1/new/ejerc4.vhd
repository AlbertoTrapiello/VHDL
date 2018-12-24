----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2018 16:04:36
-- Design Name: 
-- Module Name: ejerc4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library ieee;
use ieee.std_logic_1164.all;
entity e1 is
 port (
 a, b, c: in std_logic;
 d : out std_logic_vector(3 downto 0);
 e : out std_logic
 );
end e1;
architecture a1 of e1 is
 signal d_i: std_logic_vector(d'range);
begin
 process (a, b)
 begin
 if a = '0' then
 d_i <= ('1', others => '0');
 elsif b'event and b = '1' then
 if c = '1' then
 d_i <= d_i(0) & d_i(d_i'left downto 1); 
 end if;
 end if;
 end process;
 d <= d_i;
 e <= not d_i(0);
end a1;




