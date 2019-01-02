library IEEE;
use IEEE.std_logic_1164.all;

entity e05_demux is
  port (
    SEL : in  std_logic_vector(1 downto 0);
    DIN : in  std_logic;
    DOUT: out std_logic_vector(0 to 3)
  );
  end e05_demux;

architecture dataflow of e05_demux is
begin
  with SEL select
    DOUT <= DIN & "000"      when "00",
            '0' & DIN & "00" when "01",
            "00" & DIN & '0' when "10",
            "000" & DIN      when "11",
            "0000"           when others;
end dataflow;
