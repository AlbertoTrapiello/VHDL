----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2019 20:09:16
-- Design Name: 
-- Module Name: display - Behavioral
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

entity display is
    Port ( ud_s : in STD_LOGIC_VECTOR (6 downto 0);
           dec_s : in STD_LOGIC_VECTOR (6 downto 0);
           ud_m : in STD_LOGIC_VECTOR (6 downto 0);
           dec_m : in STD_LOGIC_VECTOR (6 downto 0);
           dig_sel : out STD_LOGIC_VECTOR (3 downto 0);
           segment : out STD_LOGIC_VECTOR (6 downto 0));
end display;

architecture Behavioral of display is

begin


end Behavioral;
