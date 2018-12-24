----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 13:30:39
-- Design Name: 
-- Module Name: mux_test_bench - Behavioral
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

entity mux_test_bench is
--  Port ( );
end mux_test_bench;

architecture Behavioral of mux_test_bench is
--    COMPONENT mux 
--        PORT(
--             a,b,s: IN STD_LOGIC;
--             y: OUT STD_LOGIC);
--    END COMPONENT; 
--    COMPONENT Mux_data_flow 
--        PORT(
--             a,b,s: IN STD_LOGIC;
--             y: OUT STD_LOGIC);
--    END COMPONENT;      
     COMPONENT Mux_Behavioral
       PORT(
            a,b,s: IN STD_LOGIC;
            y: OUT STD_LOGIC);
   END COMPONENT;      
    SIGNAL a_ts, b_ts, s_ts, y_ts: STD_LOGIC;
    BEGIN
        uut1: Mux_Behavioral PORT MAP (a => a_ts, b => b_ts, s => s_ts, y => y_ts);
    PROCESS
        BEGIN
            a_ts <= '0';
            b_ts <= '0';
            s_ts <= '0';   
            wait for 10 ns;
            s_ts <= '1';
            wait for 10 ns;
            b_ts <= '1';
            wait for 10 ns;
            s_ts <= '0';
            wait for 10 ns;
            a_ts <= '1';
            wait for 10 ns;
            b_ts <= '0';
            wait for 10 ns;
            s_ts <= '1';
            wait for 10 ns;
            b_ts <= '1';                                                                         
    END PROCESS;           
END Behavioral;
