----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2018 19:01:06
-- Design Name: 
-- Module Name: read_file - arch1
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
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity read_file is
--  Port ( );
end read_file;

architecture arch1 of read_file is
    FILE f: TEXT OPEN READ_MODE IS "name.txt";
    SIGNAL clk: BIT := '0';
    SIGNAL t_out: TIME RANGE 0 ns TO 800 ns;
    SIGNAL i_out: NATURAL RANGE 0 TO 7;
begin
PROCESS
    VARIABLE l: LINE;
    VARIABLE str1: STRING;
    VARIABLE str2: STRING;
    VARIABLE t: TIME RANGE 0 ns TO 800 ns;
    VARIABLE i: NATURAL RANGE 0 TO 7;
    BEGIN
        WAIT FOR 50 ns;
            clk <= '1';
        IF NOT ENDFILE(f) THEN
            READLINE(f, l);--lee una línea del txt y la guarda en l
            READ(l,str1);--vas pasando de l a las variables
            READ(l,t);
            READ(l,str2);
            --Para gestión de errores de lectura
            --READ(l, str1, goodvalue);
            --ASSERT goodvalue
            --REPORT "Error en lectura de i=" & INTEGER'IMAGE(i) concatena dos cadenas de texto 
            --SEVERITY FAILURE;
            READ(l,i);
            t_out <= t;
            i_out <= i;
       END IF ;
       WAIT FOR 50 ns;
            clk <= '0';                                                       
END PROCESS;        
end arch1;
