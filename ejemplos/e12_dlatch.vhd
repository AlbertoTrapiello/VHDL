library IEEE;
use IEEE.std_logic_1164.all;

-- D latch
entity e12_dlatch is
  generic (
    WIDTH: positive := 4
  );
  port (
    D: in  std_logic_vector(WIDTH - 1 downto 0);
    G: in  std_logic;
    Q: out std_logic_vector(WIDTH - 1 downto 0)
  );
end e12_dlatch;

architecture dataflow of e12_dlatch is
  signal q_i: std_logic_vector(Q'range);
begin
  q_i <= D when G = '1' else
         q_i;
  Q <= q_i;
end dataflow;
