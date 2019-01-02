library IEEE;
use IEEE.std_logic_1164.all;

-- Simple combinational logic
entity e01_logica is
  port (
    A: in  std_logic;
    B: in  std_logic;
    Y: out std_logic
  );
end e01_logica;

architecture dataflow of e01_logica is
begin
  y <= A xnor B;
end dataflow;
