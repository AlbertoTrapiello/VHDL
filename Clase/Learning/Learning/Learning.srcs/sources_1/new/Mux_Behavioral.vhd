----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 15:38:47
-- Design Name: 
-- Module Name: Mux_Behavioral - Behavioral
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

ENTITY Mux_Behavioral IS 
    PORT(
        a,b,s: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END ENTITY Mux_Behavioral;

architecture Behavioral of Mux_Behavioral is

begin
process (A, B, S)
    begin
        if S = '0' then
            Y <= A;
        else
            Y <= B;
        end if;
end process;

end Behavioral;
