----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2018 18:49:26
-- Design Name: 
-- Module Name: p1_mux - Behavioral
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

entity p1_mux is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           m : out STD_LOGIC_VECTOR (1 downto 0));
end p1_mux;

architecture Behavioral of p1_mux is

begin
PROCESS (x, y, s)
BEGIN
IF (s = "0") THEN
    m <= x;
ELSE 
    m <= y;
    END IF;
END PROCESS;
end Behavioral;
