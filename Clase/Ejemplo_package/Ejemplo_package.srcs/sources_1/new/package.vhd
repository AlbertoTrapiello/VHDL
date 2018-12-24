----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2018 15:36:54
-- Design Name: 
-- Module Name: my_package - Behavioral
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

PACKAGE my_package is
   CONSTANT flag: STD_LOGIC;
   FUNCTION down_edge(SIGNAL s: STD_LOGIC)
RETURN BOOLEAN;   
--Se peueden añadir componentes
end my_package;
PACKAGE BODY my_package IS
    CONSTANT flag: STD_LOGIC:= '1';
    FUNCTION down_edge(SIGNAL s: STD_LOGIC)
    RETURN BOOLEAN IS
    BEGIN
        RETURN (s'event AND S = '0');
    END down_edge;
END my_package;        
