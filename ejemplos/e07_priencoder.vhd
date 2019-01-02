library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Priority encoder
entity e07_priencoder is
  port (
    IRQ_N: in  std_logic_vector (6 downto 0);
    INT_N: out std_logic_vector (2 downto 0)
  );
end e07_priencoder;

architecture dataflow of e07_priencoder is
  signal irq: std_logic_vector(irq_n'range);
  signal int: std_logic_vector(int_n'range);
begin
  irq <= not IRQ_N;
  
  int <= "111" when std_match(irq, "1------") else
         "110" when std_match(irq, "01-----") else
         "101" when std_match(irq, "001----") else
         "100" when std_match(irq, "0001---") else
         "011" when std_match(irq, "00001--") else
         "010" when std_match(irq, "000001-") else
         "001" when std_match(irq, "0000001") else
         "000";

  INT_N <= not int;
end dataflow;
