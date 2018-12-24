
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
    Port ( code : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (6 downto 0);
           digsel : in STD_LOGIC_VECTOR (3 downto 0);
           digctrl : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

COMPONENT decoder
PORT (
code : IN std_logic_vector(3 DOWNTO 0);
led : OUT std_logic_vector(6 DOWNTO 0)
);
END COMPONENT;

begin

digctrl<=digsel;

Inst_decoder: decoder PORT MAP (
code => code, --El primero se refiere al del componente y el segundo al de la entidad
led => led --De este modo conectamos el componente con la entidad top
);

end Behavioral;
