library IEEE;
use IEEE.std_logic_1164.all;

entity e09_half_adder is
  port (
    A: in  std_logic;
    B: in  std_logic;
    S: out std_logic;
    C: out std_logic
  );
end e09_half_adder;

architecture dataflow of e09_half_adder is
  signal ab: std_logic_vector(1 downto 0);
begin
  ab <= A & B;

  with ab select
    S <= '0' when "00" | "11",
         '1' when others;

  with ab select
    C <= '0' when "00" | "01" | "10",
         '1' when others;
end dataflow;
