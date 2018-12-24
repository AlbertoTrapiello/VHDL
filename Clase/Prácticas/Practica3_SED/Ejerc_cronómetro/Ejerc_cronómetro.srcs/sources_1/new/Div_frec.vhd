----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2018 12:59:46
-- Design Name: 
-- Module Name: Div_frec - Behavioral
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

entity Div_frec is
    GENERIC  (n:INTEGER:=50);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end Div_frec;

architecture Behavioral of Div_frec is
SIGNAL cont: NATURAL RANGE 1 TO n;
SIGNAL clk_aux: STD_LOGIC := clk;
begin

PROCESS (clk, reset)
BEGIN
    IF (clk = '1' AND clk'event) THEN
        cont <= cont + 1;
    END IF;        
    IF cont = n THEN   
        cont <= 0;
        clk_aux <= NOT clk_aux;
    END IF;    
    clk_out <= clk_aux;
END PROCESS;
end Behavioral;
