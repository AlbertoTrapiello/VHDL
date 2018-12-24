library ieee;
use ieee.std_logic_1164.all;
entity ring_tb is
end ring_tb;
architecture behavior of ring_tb is
 component e1
 port(
 a, b, c: in std_logic;
 d : out std_logic_vector(3 downto 0)
 );
 end component;
 signal a, b, c: std_logic;
 signal d: std_logic_vector(3 downto 0);
 constant k: time := 100 ns;
 begin
  uut: e1 port map (
  a => a,
  b => b,
  c => c,
  d => d
  );
  p1: process
  begin
  b <= '0';
  wait for k / 2;
  b <= '1';
  wait for k / 2;
  end process;
  a <= '0' after 0.25 * k, '1' after 0.75 * k;
  p2: process
  begin
  wait until b = '1';
  wait for 0.75 * k;
  c <= '0';
  wait until b = '1';
  wait for 0.25 * k;
  c <= '1';
  for i in 1 to 5 loop
  wait until b = '1';
  end loop;
  assert false
  report "Test passed"
  severity failure;
  end process;
 end;