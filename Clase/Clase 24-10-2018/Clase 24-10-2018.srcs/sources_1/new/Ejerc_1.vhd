-- divisor de frecuencia 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity div_frec IS
    GENERIC (factor: INTEGER := 50);
    PORT
    (
        CE_IN, clk, RESET:IN STD_LOGIC;
        CE_OUT: OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE div_factor OF div_frec IS

BEGIN
PROCESS(CE_IN, clk, RESET)--normalmente CE_IN va por nivel y no por flanco por lo que no debdería estar aquí peor no pasa nada tampoco
    VARIABLE temp: STD_LOGIC;
    VARIABLE counter: NATURAL RANGE 0 TO factor := 1;--Para que no cuente uno de más 
    BEGIN
        IF (RESET='1') THEN 
            temp := '0';
            counter := 0;
        ELSE (clk'EVENT AND CLK='1') THEN
            IF (CE_IN = '1') THEN
                IF (counter = factor) THEN
                    temp := NOT temp;
                    counter := 0;
                ELSE
                    counter := counter + 1;    
                END IF;
            END IF;
        END IF;
        CE_OUT <= temp;    
END PROCESS;                

END ARCHITECTURE;    