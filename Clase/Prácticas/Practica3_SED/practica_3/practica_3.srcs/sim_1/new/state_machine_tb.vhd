----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2018 14:37:51
-- Design Name: 
-- Module Name: state_machine_tb - Behavioral
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
-----------------------------------------------------------------------------------
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity state_machine_tb is
--  Port ( );
end state_machine_tb;
-------------------------------------------------------------------------------------
architecture Behavioral of state_machine_tb is

    component parity_machine is
        Port (reset, x, clk: IN STD_LOGIC;
            parity: OUT STD_LOGIC);
    end component;

    SIGNAL reset_in, x_in, clk_in, parity_out: STD_LOGIC;
    CONSTANT k: TIME := 5 ns;
    

begin

    comp1: parity_machine PORT MAP(
        reset => reset_in,
        x => x_in,
        clk => clk_in,
        parity => parity_out);
        
    p1: PROCESS
    BEGIN
        clk_in <= '0';
        WAIT FOR 2*k;
        clk_in <= '1';
        WAIT FOR 2*k;
    END PROCESS;
       
   p2: PROCESS
   BEGIN
        x_in <= '1';
        WAIT FOR 1.5*k;
        x_in <= '0';
        WAIT FOR 1.5*k;
    END PROCESS;
    
    p3: PROCESS
    BEGIN
        WAIT UNTIL x_in <= '0';
        reset_in <= '1';
        WAIT FOR 20*k;
        reset_in<='0';
        WAIT FOR 20*k;
    END PROCESS;
    
    ASSERT false
    REPORT "Éxito. Simulación finalizada."
    SEVERITY failure;     

end Behavioral;
-------------------------------------------------------------------------------------