----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2018 15:42:29
-- Design Name: 
-- Module Name: demo - Behavioral
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
USE work.my_package.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity demo is
    Port ( z: OUT STD_LOGIC_VECTOR  (7 DOWNTO 0));--él tenia puesto BIT_VECTOR
end demo;

architecture Behavioral of demo is

begin
    --podria usar aquí componentes de los declarados en el package
    z(1) <= flag;
end Behavioral;
