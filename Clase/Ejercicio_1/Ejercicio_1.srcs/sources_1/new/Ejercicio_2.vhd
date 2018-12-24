----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2018 19:23:21
-- Design Name: 
-- Module Name: hamming - hamming_weight
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

ENTITY hamming IS
GENERIC (N: INTEGER :=3);
    PORT ( 
        x: IN BIT_VECTOR (N-1 DOWNTO 0);
        y: OUT INTEGER RANGE 0 TO N  );
        
END hamming;

ARCHITECTURE hamming_weight OF hamming IS
TYPE natural_array IS ARRAY (0 TO N) OF NATURAL RANGE 0 TO N;
SIGNAL internal: natural_array;
    BEGIN
    internal(0) <= 0;
    gen: FOR i IN 1 TO N GENERATE
        internal(i) <= internaL(i-1) + 1 WHEN x(i-1)='1' ELSE internal(i-1);   
    END GENERATE;   
    y <= internal(N);
end hamming_weight;
