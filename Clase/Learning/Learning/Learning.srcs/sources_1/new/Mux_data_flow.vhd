----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 15:11:09
-- Design Name: 
-- Module Name: Mux_data_flow - Behavioral
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

ENTITY Mux_data_flow IS 
    PORT(
        a,b,s: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END ENTITY Mux_data_flow;

ARCHITECTURE Dataflow OF Mux_data_flow IS

BEGIN
    y <= a when s = '0' 
    ELSE b;
END Dataflow;
