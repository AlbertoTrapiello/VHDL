library IEEE;
use IEEE.std_logic_1164.all;

--Binary to decimal decoder
entity e06_bin2dec is
  port (
    A: in  std_logic_vector (3 downto 0);
    Y: out std_logic_vector (9 downto 0)
  );
end e06_bin2dec;

architecture dataflow of e06_bin2dec is
begin
  with A select
    Y <= "0000000001" when "0000",
         "0000000010" when "0001",
         "0000000100" when "0010",
         "0000001000" when "0011",
         "0000010000" when "0100",
         "0000100000" when "0101",
         "0001000000" when "0110",
         "0010000000" when "0111",
         "0100000000" when "1000",
         "1000000000" when "1001",
         "0000000000" when others;
end dataflow;
