----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2018 11:11:34
-- Design Name: 
-- Module Name: mux_mixto - Behavioral
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


ENTITY mux_mixto IS
	PORT(
    u, v, w: IN STD_LOGIC_VECTOR (0 TO 2);
    s: IN STD_LOGIC_VECTOR (0 TO 2);
    m : OUT STD_LOGIC_VECTOR (0 TO 2));
END  mux_mixto;

ENTITY mux IS
	PORT(
    x, y: IN STD_LOGIC_VECTOR (0 TO 2);
    s: IN STD_LOGIC;
    m0 : OUT STD_LOGIC_VECTOR (0 TO 2));
END mux;

architecture Behavioral of mux_mixto is
SIGNAL temp: STD_LOGIC_VECTOR (0 TO 2);
COMPONENT mux1: mux PORT MAP(u=>x, v =>y, s[0]=>s, temp=>m0);
COMPONENT mux1: mux PORT MAP(w=>x, temp =>y, s[1]=>s, m=>m0);
BEGIN
	PROCESS (u,v,w,s.m)
--ERRRORES DE SINTAXIS QUE NO CONSEGUIMOS SOLUCIONAR
END PROCESS;
END behavioral;
