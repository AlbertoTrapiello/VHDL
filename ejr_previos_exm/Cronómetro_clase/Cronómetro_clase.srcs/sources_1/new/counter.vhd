----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2019 20:09:16
-- Design Name: 
-- Module Name: counter - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( clr : in STD_LOGIC;
           CE_N : in STD_LOGIC;
           clk : in STD_LOGIC;
           Num : out STD_LOGIC_VECTOR (3 downto 0);
           diez : out STD_LOGIC);
end counter;

architecture Behavioral of counter is
signal counter: unsigned (Num'range);
begin
process (clk, CE_N)

begin  
    if(CE_N = '1') then
        if rising_edge(clk)  then 
            if clr = '0' OR counter = "1001" then 
                counter <= (others => '0');
            end if;
            else
                counter <= counter + 1;
        end if;
    end if;
end process;
Num <= std_logic_vector(counter);
end Behavioral;
