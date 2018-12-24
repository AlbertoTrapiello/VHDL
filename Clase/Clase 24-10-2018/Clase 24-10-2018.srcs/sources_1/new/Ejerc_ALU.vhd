----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2018 15:13:39
-- Design Name: 
-- Module Name: Ejerc_ALU - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ejerc_ALU is
    GENERIC (N: INTEGER := 8);
    Port
    ( 
        a,b :IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
        cin:IN STD_LOGIC;
        opcode: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        y: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)  
    );
end Ejerc_ALU;

architecture arch1 of Ejerc_ALU is
SIGNAL a_sig, b_sig, y_sig: SIGNED (N-1 DOWNTO 0);
SIGNAL y_unsig: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
SIGNAL small_int: INTEGER RANGE 0 TO 1;
begin
    --LOGIC UNIT
    WITH opcode(2 DOWNTO 0) SELECT --el bit más significativo selecciona entre logic o arithmetic y los otros tres deciden la opreación
        y_unsig <= NOT a WHEN "000";
                   NOT b WHEN "001";
         --faltan opciones
                   a XNOR b WHEN OTHERS ;--siempre conviene poner el others par cubrirse las espaldas
                   
    --ARITHMETIC UNIT
    a_sig <= SIGNED(a); --tablita de convesiones y vemos que esa es la función a usar
    b_sig <= SIGNED(b);
    small_int <= 1 WHEN cin = '1' ELSE 0;--no vale SIGNED porque es de vector a signed y con es un bit
    WITH opcode(2 DOWNTO 0) SELECT
        y_sig <= a_sig WHEN "000";
                 b_sig WHEN "001";
                 a_sig+1 WHEN "000";--no es  '1' porque nos es un 1 lógico
                 a_sig + be_sig WHEN "110";
                 a_sig + b_sig + small_int WHEN OTHERS;--puede desbordar  y sin señal de carry o un bit más en la salida se pierde
                 --Pero al usarlo con signed no da error de overflow, mientras que con entero si
                 
    -- MUX
    WITH opcode(3) SELECT
        y <= y_unsig WHEN '0';
             STD_LOGIC_VECTOR(y_sig) WHEN OTHERS;--y_sig es SIGNED y queremos convertirlo a STD_LOGIC_VECTOR             
end Behavioral;
