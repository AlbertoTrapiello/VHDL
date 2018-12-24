----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2018 19:18:45
-- Design Name: 
-- Module Name: half_adder - arhc1
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

entity half_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           C : out STD_LOGIC);
end half_adder;

architecture Dataflow of half_adder is
SIGNAL ab: STD_LOGIC_VECTOR(1 DOWNTO 0);
begin
    ab <= A & B;
    WITH ab SELECT 
        S <= '0' WHEN "00" | "11",
             '1' WHEN OTHERS;
    WITH ab SELECT 
        S <= '0' WHEN "00" | "10" | "01",
        '1' WHEN OTHERS;
end Dataflow;
--HACER FULL ADDER (OBLIGATORIO) CONFORMADO POR HALF ADDER'S Y FULL ADDER DE N ENTRADAS CONFORMADO POR FULL ADDERS (OPCIONAL)