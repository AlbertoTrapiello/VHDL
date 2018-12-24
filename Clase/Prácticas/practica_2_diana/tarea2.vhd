LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY top IS
 PORT ( code : IN std_logic_vector(3 DOWNTO 0);
 digsel : IN std_logic_vector(3 DOWNTO 0);
 digctrl : OUT std_logic_vector(3 DOWNTO 0);
 segment : OUT std_logic_vector(6 DOWNTO 0)
 );
END top;
ARCHITECTURE behavioral OF top IS
COMPONENT decoder
PORT (
code : IN std_logic_vector(3 DOWNTO 0);
led : OUT std_logic_vector(6 DOWNTO 0)
);
END COMPONENT;
Begin
Inst_decoder: decoder PORT MAP (
code => code ,
led => segment
);
digctrl <= not digsel;
End architecture;