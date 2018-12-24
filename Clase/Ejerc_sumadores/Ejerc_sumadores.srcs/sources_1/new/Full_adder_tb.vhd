----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2018 15:59:17
-- Design Name: 
-- Module Name: Full_adder_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--EL TESTBENCH LO HE HECHO YO

entity Full_adder_tb IS
GENERIC (N: POSITIVE := 2);
--  Port ( );
end Full_adder_tb;

architecture Behavioral of Full_adder_tb is
COMPONENT ADDER is
    GENERIC (WIDHT: POSITIVE := 2);
    Port ( A : in SIGNED (WIDHT-1 DOWNTO 0); --Mejor poner con signo porque vamos a estar sumando y restando ??
           B : in SIGNED (WIDHT-1 DOWNTO 0);
           Cin : in STD_LOGIC;  
           S : out SIGNED (WIDHT-1 DOWNTO 0);
           Cout : out STD_LOGIC);
end COMPONENT;
SIGNAL Atb : SIGNED (N-1 DOWNTO 0); --Mejor poner con signo porque vamos a estar sumando y restando ??
SIGNAL Btb : SIGNED (N-1 DOWNTO 0);
SIGNAL Cintb : STD_LOGIC;  
SIGNAL Stb : SIGNED (N-1 DOWNTO 0);
SIGNAL Couttb : STD_LOGIC;
begin
uut: ADDER 
    GENERIC MAP (WIDHT => N)
    PORT MAP(Atb,Btb,Cintb,Stb,Couttb);
    PROCESS
    BEGIN
        Atb <= "00";
        Btb <= "01";
        Cintb <= '0';
        WAIT FOR 15 ns;
        Atb <= "01";
        Btb <= "01";
        Cintb <= '1';
        WAIT FOR 15 ns;
        Atb <= "10";
        Btb <= "11";
        Cintb <= '0';
        WAIT FOR 15 ns;
        Atb <= "11";
        Btb <= "11";
        Cintb <= '1';
        WAIT FOR 15 ns; 
        WAIT;
    END PROCESS;                           
end Behavioral;
