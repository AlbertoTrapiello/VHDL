----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.01.2019 20:02:44
-- Design Name: 
-- Module Name: PWM - Behavioral
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM is
    Generic (Width: positive := 9); -- No creo que sea necesario pero siempre queda chulo
    Port ( RESET_N : in STD_LOGIC;
           clk : in STD_LOGIC;
           LOAD_N : in STD_LOGIC;
           DUTY : in STD_LOGIC_VECTOR (Width downto 0);-- Aqu� no me queda claro si en el examen quer�an un n�mero
                                                   -- entre 9 y 0 (decimal)o un std_logic_vector de 10 bits,
                                                   -- he puesto esto pero preguntar�a
           EN : in STD_LOGIC;
           GATE : out STD_LOGIC);
end PWM;

-- Dado que en el examen te piden que se lo hagas todo junto, he tomado cada una de las diferentes
-- entidades que compondr�an (seg�n mi criterio) el generador de PWM y 
-- las he ido definiendo en diferentes process


architecture Behavioral of PWM is
--signal lamp_clk: std_logic;--Declaro esta variable para poder ir generando 
                           --la se�al de menor frecuencia que la del reloj de la FPGA
signal count: unsigned (DUTY'range);-- Se�al que va llevar la cuenta del contador para poder
                                    -- poner a 1 la salida la cantidad de ciclos asociados al DUTY cycle
                                    -- que se introduzca a la entrada
signal GATE_aux: STD_LOGIC := '1'; -- Se�al auxiliar para trabajar con ella 
signal duty_aux: unsigned (DUTY'range);-- se�al que sirve para guardar el valor de entrada de DUTY
                                       -- y poder comparar con count
begin

--ESTA ERA UNA PRIMERA IDEA PERO NO SIRVE AQU�, CREO. DEJO EL C�DIGO POR SI ACASO QQUIERES VER UN DIVISOR DE FRECUENCIA
--div_freq:Process(clk, RESET_N)
---- Para poder poner el PWM a una frecuencia fija se puede realizar este componente 
---- que se encarga de que a la salida se obtenga una se�al de frecuencia menor a la de la entrada 
---- (presumiblemente la se�al del reloj de la FPGA)

--variable div_Frec_lamp: positive := 2; -- n�mero que implica que la se�al de salida ser� id�ntica 
---- a la entrada pero con una frecunecia que es un cuarto de la de entrada 
---- (la parte de 1/4 no estoy 100% seguro, pero menor desde luego)
--variable cont: positive := 0; -- Para poder reducir la frecuencia se puede contar n�mero de flancos positivos
----  y cuando el contador llegue al valor de div_Frec_lamp se resetea y cambia el valor de la salida 
---- generado de esta manera otra se�al cuadrada con otra frecuencia
--begin
--    if (rising_edge(clk)) then --Con cada flanco positivo del clock aumenta el contador
--        cont := cont +1;
--        if cont = div_Frec_lamp then --En el momento que se alcance el valor estipulado 
--            lamp_clk <= not lamp_clk; -- se cambia el valor de la "salida"   
--        end if;
--    end if;
--end Process;

--El contador se parece m�s al visto en el ejemplo de moodle
contador:Process(clk, RESET_N)-- En la lista se escogen aquellas entradas cuyo cambio implican
                                   -- que se ha de ejecuar el c�digo (LOAD en este caso es s�ncrono)
begin
    if RESET_N = '0' then -- El reset es as�ncrono por lo que quedar�a fuera de la lista de sensibilidad
        -- te dicen que pongas las salidas a cero
        GATE_aux <= '0';
        count <= (others => '0'); -- para poder poner todos a 0 independientemente del tama�o del vector
    elsif rising_edge(clk) then -- dentro todo lo s�ncrono
        if EN = '0' then -- no tiene por qu� ir dentro del rising_edge(clk),
                         -- pero de este modo se consigue que bloquee la cuenta
            GATE_aux <= '0';
        else
            count <= count + 1;
            if LOAD_N = '0' then
                duty_aux <= unsigned(DUTY); --Se asigna en la se�al auxiliar count el valor designado en la entrada
            end if; 
        end if;
    end if;    
end Process;

Comparador: Process(count, clk)
begin
    if EN = '1' then --un poco redundante
        if count < duty_aux then
            GATE_aux <= '1'; -- Se pone a uno la salida ya que el valor del tiempo es menor que el del duty
        else
            GATE_aux <= '0';
        end if;        
    end if;
end Process;
GATE <= GATE_aux; -- se asigna de manera concurrente el valor de la se�al auxiliar a la salida
end Behavioral;
