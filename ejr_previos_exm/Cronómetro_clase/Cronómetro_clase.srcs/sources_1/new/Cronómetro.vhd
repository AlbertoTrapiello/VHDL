----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2019 19:43:26
-- Design Name: 
-- Module Name: Cronometro - Behavioral
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

entity Cronometro is
    Port ( Start : in STD_LOGIC;
           Reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           Display : in STD_LOGIC_VECTOR (6 downto 0);
           Dis_selector : in STD_LOGIC);
end Cronometro;

architecture Behavioral of Cronometro is

begin


end Behavioral;
