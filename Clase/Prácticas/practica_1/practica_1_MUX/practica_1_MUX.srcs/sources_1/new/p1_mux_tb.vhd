----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2018 20:03:51
-- Design Name: 
-- Module Name: p1_mux_tb - Behavioral
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

entity p1_mux_tb is
end p1_mux_tb;

architecture Behavioral of p1_mux_tb is
COMPONENT mux 
    PORT ( x : in STD_LOGIC_VECTOR (1 downto 0);
          y : in STD_LOGIC_VECTOR (1 downto 0);
          m : out STD_LOGIC_VECTOR (1 downto 0);
          s : in STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT;
 SIGNAL xi : in STD_LOGIC_VECTOR (1 downto 0) ;
 SIGNAL yi : in STD_LOGIC_VECTOR (1 downto 0) ;
 SIGNAL mi : out STD_LOGIC_VECTOR (1 downto 0);
 SIGNAL si : in STD_LOGIC_VECTOR (1 downto 0);
   
begin
ut_1: mux PORT MAP(
x => xi. y => yi, s => si, m => mi);

end Behavioral;
