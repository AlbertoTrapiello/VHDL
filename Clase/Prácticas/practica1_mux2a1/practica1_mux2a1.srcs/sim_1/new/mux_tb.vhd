----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2018 21:29:23
-- Design Name: 
-- Module Name: mux_tb - behaviour
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

library UNISIM;
use UNISIM.VComponents.all;
----------------------------------------------------------------------------------

ENTITY mux_tb IS
--  Port ( );
END mux_tb;
----------------------------------------------------------------------------------

ARCHITECTURE behaviour OF mux_tb IS
    COMPONENT mux IS
        PORT(
            x, y, s : IN STD_LOGIC;
            m : OUT STD_LOGIC);
    END COMPONENT;
    
    SIGNAL x_in, y_in, s_in, m_out: STD_LOGIC;

BEGIN
    out1: mux PORT MAP(
        x => x_in,
        y => y_in,
        s => s_in,
        m => m_out);
        
    PROCESS
    BEGIN
        x_in <= '0';
        y_in <= '0';
        s_in <= '0';
        WAIT FOR 10 ns;
        y_in <= '1';
        WAIT FOR 10 ns;
        x_in <= '1';
        WAIT FOR 10 ns;
        y_in <= '0';
        WAIT FOR 10 ns;
        x_in <= '0';
        s_in <= '1';
        WAIT FOR 10 ns;
        y_in <= '1';
        WAIT FOR 10 ns;
        x_in <= '1';
        WAIT FOR 10 ns;
        y_in <= '0';
        WAIT FOR 10 ns;
    
    END PROCESS;

END behaviour;
