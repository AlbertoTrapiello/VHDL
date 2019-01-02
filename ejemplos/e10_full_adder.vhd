library IEEE;
use IEEE.std_logic_1164.all;

entity e10_full_adder is
  port (
    A : in  std_logic;
    B : in  std_logic;
    CI: in  std_logic;
    S : out std_logic;
    CO: out std_logic
  );
end e10_full_adder;

architecture structural of e10_full_adder is
  component e09_half_adder is
    port (
      A: in  std_logic;
      B: in  std_logic;
      S: out std_logic;
      C: out std_logic
    );
  end component;
  
  signal s1: std_logic;
  signal c1: std_logic;
  signal c2: std_logic;
begin
  ha1: e09_half_adder port map (
      A => A,
      B => B,
      S => s1,
      C => c1
  );

  ha2: e09_half_adder port map (
      A => s1,
      B => CI,
      S => S,
      C => c2
  );

  CO <= c1 or c2;
end structural;
