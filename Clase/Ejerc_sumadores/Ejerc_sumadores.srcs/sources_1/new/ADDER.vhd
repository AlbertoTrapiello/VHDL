----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2018 15:32:42
-- Design Name: 
-- Module Name: ADDER - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADDER is
    GENERIC (WIDHT: POSITIVE := 4);
    Port ( A : in SIGNED (WIDHT-1 DOWNTO 0); --Mejor poner con signo porque vamos a estar sumando y restando ??
           B : in SIGNED (WIDHT-1 DOWNTO 0);
           Cin : in STD_LOGIC;  
           S : out SIGNED (WIDHT-1 DOWNTO 0);
           Cout : out STD_LOGIC);
end ADDER;

architecture Behavioral of ADDER is
COMPONENT Full_adder is
    Port ( AT : in STD_LOGIC;
           BT: in STD_LOGIC;
           CinT : in STD_LOGIC;
           sT : out STD_LOGIC;
           CoutT : out STD_LOGIC);
end COMPONENT;
SIGNAL Carry: STD_LOGIC_VECTOR (WIDHT DOWNTO 0);
begin
    carry(0) <= Cin;
    adderh: FOR i IN 0 TO WIDHT-1 GENERATE
    BEGIN
        fa_i: Full_adder 
            PORT MAP(
                AT => A(i),--STD_LOGIC es más genérico por lo que debería poder pasar de SIGNED a STD_LOGIC sin problemas, si no se necesitaría una conversión
                BT => B(i),
                CinT => Carry(i),
                ST => S(i),
                CoutT => carry(i+1)
                );
    END GENERATE;
    Cout <= carry (WIDHT);            
end Behavioral;
