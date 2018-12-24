library IEEE;
use IEEE.std_logic_1164.all;
entity E1_TB is
end E1_TB;
architecture BEHAVIORAL of E1_TB is
 component E1
 port(
 A: in std_logic;
 B: in std_logic;
 C: in std_logic;
 D: in std_logic_vector(3 downto 0);
  E: out std_logic_vector(3 downto 0)
 );
 end component;
 signal A, B: std_logic;
 signal C : std_logic := '0';
 signal D, E: std_logic_vector(3 downto 0);
 constant K: time := 10 ns;
begin
 uut: e1 port map (
 A => A,
 B => B,
 C => C,
 D => D,
 E => E
 );
 C <= not C after 0.5 * K;
 stim_proc: process
 begin
 wait for 0.25 * K;
 D <= X"A";
 A <= '0', '1' after 0.5 * K;
 wait for 0.25 * K;
 B <= '0', '1' after 0.5 * K;
 wait until B = '1';
 for i in 1 to 4 loop
 wait until C = '1';
 end loop;
 assert false
 report "Simulation finished."
 severity failure;
 end process;
end;
