library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Tri-state buffer
entity e02_bufferz is
  port (
    A   : in  std_logic;
    OE_N: in  std_logic;
    B   : out std_logic);
end e02_bufferz;

architecture dataflow of e02_bufferz is
begin
  B <= A when OE_N = '0' else
       'Z';
end dataflow;

