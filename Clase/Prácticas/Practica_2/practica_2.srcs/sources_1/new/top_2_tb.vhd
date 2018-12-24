----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2018 12:07:36
-- Design Name: 
-- Module Name: top_2_tb - top_2_tb
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

entity top_2_tb is
--  Port ( );
end top_2_tb;

architecture top_2_tb of top_2_tb is
component top2 is
port( button, rst, clk: in std_logic;
   digsel: in std_logic_vector (3 downto 0);
   segment: out std_logic_vector (6 downto 0);
   digctrl: out std_logic_vector (3 downto 0));
end component; 
signal button, rst, clk: std_logic;
signal digsel, digctrl: std_logic_vector (3 downto 0);
signal segment: std_logic_vector (6 downto 0);

begin
uut: top2 port map(button, rst, clk, digsel, segment, digctrl);

process
begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
end process;
process
begin
        rst <= '1';
        button <= '1';
        wait for 10 ns;
        button <= '0';
        wait for 10 ns;
end process;
process
begin
    digsel <= "0000";
    wait for 10 ns;
    digsel <= "0010";
    wait for 10 ns;
    digsel <= "0100";
    wait for 10 ns;
    digsel <= "1000";
    wait for 10 ns;
            
end process;

end top_2_tb;
