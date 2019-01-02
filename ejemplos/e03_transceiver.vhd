library IEEE;
use IEEE.std_logic_1164.all;

-- Bidirectional transceiver
entity e03_transceiver is
  generic (
    WIDTH: positive := 8
  );
  port (
    DIR: in    std_logic;
    A  : inout std_logic_vector(WIDTH - 1 downto 0);
    B  : inout std_logic_vector(WIDTH - 1 downto 0)
  );
end e03_transceiver;

architecture dataflow of e03_transceiver is
begin
  B <= A when DIR = '0' else
       (others => 'Z');
  A <= B when DIR = '1' else
       (others => 'Z');
end dataflow;
