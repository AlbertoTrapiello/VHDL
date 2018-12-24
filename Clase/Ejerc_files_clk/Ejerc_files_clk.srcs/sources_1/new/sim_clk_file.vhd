----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2018 18:47:20
-- Design Name: 
-- Module Name: sim_clk_file - Behavioral
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

entity write_to_file is
--  Port ( );
end write_to_file;

architecture arch1 of write_to_file is
CONSTANT period: TIME:= 100 ns;
SIGNAL clk: BIT:='0';
FILE f: TEXT OPEN WRITE_MODE IS "name.txt";
begin
PROCESS
    CONSTANT str1: STRING(1 TO 2):= "t=";--Te ahorras escribirlo todo el rato
    CONSTANT str2: STRING(1 TO 2):= "i=";
    VARIABLE l: LINE;--necesitas escribir primero aquí y luego ya en el fichero
    VARIABLE t:TIME RANGE 0 ns TO 800 ns;
    VARIABLE i: NATURAL RANGE 0 TO 7:=0; --hasta donde tengas pensado contar, mejor con genérico
    BEGIN 
        WAIT FOR period/2;
            clk <= '1';
        t:= period/2 + i*period;
        WRITE(l,str1); WRITE(l,t); WRITE(l,str2); WRITE(l,i);
        WRITELINE(f,l);
        WAIT FOR period/2;
            clk <= '0';     
END PROCESS;
end arch1;

