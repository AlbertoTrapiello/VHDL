----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 18:42:53
-- Design Name: 
-- Module Name: Ejecrc-1-test-bench - Behavioral
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

entity Ejecrc_1_test_bench is
GENERIC (N: INTEGER := 3);
--  Port ( )
end Ejecrc_1_test_bench;

architecture Behavioral of Ejecrc_1_test_bench is
COMPONENT parity_generator IS
   -- GENERIC (N: INTEGER := 3); --number of bits
    PORT (
        x: IN BIT_VECTOR(N-1 DOWNTO 0);
        y: OUT BIT_VECTOR(N DOWNTO 0));
    END COMPONENT;

SIGNAL x_tb: BIT_VECTOR (N-1 DOWNTO 0);
SIGNAL Y_tb: BIT_VECTOR (N DOWNTO 0);
begin
uut1: parity_generator PORT MAP (x_tb, y_tb);
process
begin 
x_tb <= "010";
wait for 10 ns;
x_tb <= "110";
wait for 10 ns;
x_tb <= "000";
wait for 10 ns;

end process;
end Behavioral;
