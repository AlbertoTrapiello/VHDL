----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2018 19:04:35
-- Design Name: 
-- Module Name: Circular_shift - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY mux IS
    PORT (a,b,sel: IN BIT;
        x:OUT BIT);
END ENTITY;        

ENTITY flip_flop IS 
    PORT (d,clk:IN BIT;
          q: OUT BIT);
END ENTITY;
entity Circular_shift is
    Port ( clk, load : in BIT;
           q : BUFFER BIT_VECTOR (0 TO 3);--En lugar de INOUT proque así puedes conectar entradas a ella
           d: IN BIT_VECTOR (0 TO 3)
           );
end Circular_shift;

architecture structural of Circular_shift is
SIGNAL i: BIT_VECTOR (0 TO 3);--Señal auxiliar para poder pasar la info de cada mux a cada flip-flop
COMPONENT mux IS
    PORT (a,b,sel:IN BIT; x:OUT BIT);
    END COMPONENT;
COMPONENT flip_flop IS     
    PORT (d,clk:IN BIT; q:OUT BIT);
    END COMPONENT;
begin

mux1: mux PORT MAP(q(3), d(0), load, i(0));

mux2: mux PORT MAP(q(0), d(1), load, i(1));

mux3: mux PORT MAP(q(1), d(2), load, i(2));

mux4: mux PORT MAP(q(2), d(3), load, i(3));

ff1: flip_flop PORT MAP(
    d => i(0),
    clk => clk,
    q => q(0)
    );
ff2:flip_flop  PORT MAP (i(1),clk,q(1));
ff3:flip_flop  PORT MAP (i(2),clk,q(2));
ff4:flip_flop  PORT MAP (i(3),clk,q(3));   

end Behavioral;
