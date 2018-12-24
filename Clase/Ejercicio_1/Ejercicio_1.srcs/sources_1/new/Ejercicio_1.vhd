----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 18:39:51
-- Design Name: 
-- Module Name: Parity_generator - Behavioral
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
ENTITY parity_generator IS
GENERIC (N: INTEGER := 3); --number of bits
PORT (
x: IN BIT_VECTOR(N-1 DOWNTO 0);
y: OUT BIT_VECTOR(N DOWNTO 0));
END ENTITY;
ARCHITECTURE ok OF parity_generator IS
SIGNAL internal: BIT_VECTOR(N-1 DOWNTO 0);
BEGIN
internal(0) <= x(0);
gen: FOR i IN 1 TO N-1 GENERATE
internal(i) <= internaL(i-1) XOR x(i);
END GENERATE;
y <= (NOT internal(N-1)) & x;
END ok;