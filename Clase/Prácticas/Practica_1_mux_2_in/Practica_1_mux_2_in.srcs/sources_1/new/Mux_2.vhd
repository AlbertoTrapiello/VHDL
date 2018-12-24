----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2018 20:45:18
-- Design Name: 
-- Module Name: mux - behavioral
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

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.

LIBRARY UNISIM;
USE UNISIM.VComponents.all;
----------------------------------------------------------------------------------

ENTITY mux IS
	PORT(
    x, y: IN STD_LOGIC_VECTOR (0 TO 2);
    s: IN STD_LOGIC;
    m : OUT STD_LOGIC_VECTOR (0 TO 2));
END mux;
----------------------------------------------------------------------------------

ARCHITECTURE behavioral OF mux IS


BEGIN
	PROCESS (x,y,s)
    BEGIN
        IF s='0' THEN
            m <= x;
        ELSE
            m <= y;
        END IF;
END PROCESS;
END behavioral;