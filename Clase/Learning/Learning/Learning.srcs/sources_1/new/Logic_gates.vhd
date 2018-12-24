----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 12:42:02
-- Design Name: 
-- Module Name: Logic_gates - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY inv IS
    PORT(
        i: IN STD_LOGIC;
        o: OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE inversor OF inv IS
        BEGIN
            o<= NOT(i);        
        END ARCHITECTURE inversor;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY and2 IS
    PORT(
        a,b: IN STD_LOGIC;
        y: OUT STD_LOGIC);
    END ENTITY;
    
        ARCHITECTURE and_gate OF and2 IS
            BEGIN
                 y<= a AND b;        
        END ARCHITECTURE; 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY or2 IS
    PORT(
        a,b: IN STD_LOGIC;
        y: OUT STD_LOGIC);
    END ENTITY;
    
        ARCHITECTURE or_gate OF or2 IS
            BEGIN
                 y<= a OR b;        
        END ARCHITECTURE; 
    
   