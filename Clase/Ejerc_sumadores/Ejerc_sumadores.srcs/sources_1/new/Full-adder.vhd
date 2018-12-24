----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2018 15:18:46
-- Design Name: 
-- Module Name: Full-adder - Behavioral
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

entity Full_adder is
    Port ( AT : in STD_LOGIC;
           BT: in STD_LOGIC;
           CinT : in STD_LOGIC;
           sT : out STD_LOGIC;
           CoutT : out STD_LOGIC);
end Full_adder;

architecture half_adders of Full_adder is
COMPONENT half_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           C : out STD_LOGIC);
end COMPONENT;
SIGNAL S1: STD_LOGIC;
SIGNAL C1: STD_LOGIC;
SIGNAL C2: STD_LOGIC;
begin
    ha1: half_adder 
        PORT MAP
        (
            A => AT,
            B => BT,
            S => S1,
            C => C1
        );   
          
    ha2: half_adder
        PORT MAP
        (
            A => S1,
            B => CinT,
            S => ST,
            C => C2
            );      
    CoutT <= C1 OR C2;
end half_adders;
