library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

ENTITY conv_paral_serie IS
    GENERIC ( width : POSITIVE := 4)
    PORT
    (
        clk, LOAD, CLR_N: IN STD_LOGIC;
        PI: IN STD_LOGIC_VECTOR(width - 1 TO 0);
        SO: OUT STD_LOGIC
    );
ARCHITECTURE behavioral OF conv_paral_serie IS
    SIGNAL reg: STD_LOGIC_VECTOR (width -1 DOWNTO 0);--podría ser desde 'lenght, 'inverse-range, etc
    BEGIN
        PROCESS(clk, CLR_N)
        BEGIN
            IF CLR_N = '0' THEN
                reg <= "0";
            ELSE IF rising_edge(clk) THEN
                IF LOAD = '1' THEN --LOAD ha de ser un pulso más largo que clk para que pueda entrar, suelen venir en las especificaciones
                    reg <= PI;
                ELSE --Saco el LSB y relleno con 0's desde el MSB
                    reg <= '0' & reg(width - 1 DOWNTO 1);   --reg'left also
                END IF;
            END IF;
        END PROCESS;
        SO <= reg(0);--Va fuera proque reg es una señal definida en la arcquitectura y puede estar dentro o fuera
    END behavioral;                     