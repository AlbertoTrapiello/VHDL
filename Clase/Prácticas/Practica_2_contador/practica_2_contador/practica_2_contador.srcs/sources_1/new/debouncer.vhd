library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


ENTITY debouncer IS
 port (
 clk : in std_logic;--entrada de reloj que sincroniza al sistema
 rst : in std_logic;--entrada de reset necesaria en caso de que se desee resetear al debouncer 
 btn_in : in std_logic;--es la entrada del botón sincronizada
 btn_out : out std_logic);--es la salida con el valor definitivo una vez filtrados los rebotes
END debouncer;

ARCHITECTURE behavioral OF debouncer IS
 signal Q1, Q2, Q3 : std_logic;--Señales auxiliares que permiten evaluar siempre evaluar los valores anteriores de la señal
BEGIN
 process(clk)--se obliga a entrar con cada cambio de reloj
 begin
if (clk'event and clk = '1') then --ante el flanco de subida del reloj
  if (rst = '0') then --en caso de que la señeal reset esté activa a (nivel bajo)
  Q1 <= '0';-- asigna ceros en caso de que esté reseteado
  Q2 <= '0';-- asigna ceros en caso de que esté reseteado
  Q3 <= '0';-- asigna ceros en caso de que esté reseteado
  else
  Q1 <= btn_in;--le asigna a Q1 e valor actual 
  Q2 <= Q1;--le asigna a Q2 el valor de Q1 que como no ha sido actualizado es el que tuviera de la iteración anerior
  Q3 <= Q2;--le asigna a Q3 el valor de Q2 que como no ha sido actualizado es el que tuviera de la iteración anerior

  end if;
  end if;
  end process;
  btn_out <= Q1 and Q2 and (not Q3);--saca por la salida la lógica tal que si el actual y el anterior son uno y antes tenían un cero considera 
  --que ya se ha alcanzado el régimen permanente
 END behavioral;