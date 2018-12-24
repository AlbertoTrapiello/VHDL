----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 19:39:49
-- Design Name: 
-- Module Name: Ejercicio_2_test_bench - Behavioral
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

entity Ejercicio_2_test_bench is
--  Port ( );
GENERIC (N: INTEGER :=3);
end Ejercicio_2_test_bench;

architecture Behavioral of Ejercicio_2_test_bench is
COMPONENT hamming IS

    PORT ( 
        x: IN BIT_VECTOR (N-1 DOWNTO 0);
        y: OUT INTEGER RANGE 0 TO N );      
END COMPONENT;


SIGNAL x_tb: BIT_VECTOR (N-1 DOWNTO 0);
SIGNAL y_tb: INTEGER RANGE 0 TO N ;

begin

uut1: hamming PORT MAP (x_tb, y_tb);

PROCESS
BEGIN
    x_tb <= "111";
    wait for 10 ns;
    x_tb <= "101";
    wait for 10 ns;
    x_tb <= "000";
    wait for 10 ns;

END PROCESS;

end Behavioral;
