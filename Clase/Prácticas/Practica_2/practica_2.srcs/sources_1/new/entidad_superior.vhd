----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2018 12:42:12
-- Design Name: 
-- Module Name: top - arch_top
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
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
---------------------------------------------------------------------------------
entity top is
    PORT ( 
            code : IN std_logic_vector(3 DOWNTO 0);
            digsel : IN std_logic_vector(3 DOWNTO 0);
            digctrl : OUT std_logic_vector(3 DOWNTO 0);
            segment : OUT std_logic_vector(6 DOWNTO 0));
end top;
---------------------------------------------------------------------------------
architecture arch_top of top is


COMPONENT decoder
    PORT (
            code : IN std_logic_vector(3 DOWNTO 0);
            led : OUT std_logic_vector(6 DOWNTO 0));
END COMPONENT;

begin

    Inst_decoder: decoder PORT MAP (
        code => code,
        led => segment
    );
    
    digctrl<= not digsel;

end arch_top;
