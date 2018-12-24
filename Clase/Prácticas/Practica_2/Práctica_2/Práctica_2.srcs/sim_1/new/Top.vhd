----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2018 12:40:31
-- Design Name: 
-- Module Name: Top - Behavioral
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

ENTITY top IS
 PORT ( code : IN std_logic_vector(3 DOWNTO 0);
 digsel : IN std_logic_vector(3 DOWNTO 0);
 digctrl : OUT std_logic_vector(3 DOWNTO 0);
 segment : OUT std_logic_vector(6 DOWNTO 0)
 );
END top;

architecture Archer of Top is
COMPONENT decoder
PORT (
code : IN std_logic_vector(3 DOWNTO 0);
led : OUT std_logic_vector(6 DOWNTO 0)
);
END COMPONENT;
begin
Inst_decoder: decoder PORT MAP (
code => code,
led => segment
);
digctrl <= digsel;
end Archer;
