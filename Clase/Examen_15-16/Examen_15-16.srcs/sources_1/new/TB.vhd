library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity e1_tb is
end e1_tb;
architecture behavior of e1_tb is
 component e1
 port(
 a: in std_logic;
 b: in std_logic;
 c: in std_logic;
 d: in std_logic_vector(3 downto 0);
 e: out std_logic_vector(3 downto 0)
 );
 end component;
  signal a: std_logic;
 signal b: std_logic := '0';
 signal c: std_logic;
 signal d: std_logic_vector(3 downto 0);
 signal e: std_logic_vector(3 downto 0);
 constant k: time := 100 ns;
begin
 uut: e1 port map (
 a => a,
 b => b,
 c => c,
 d => d,
 e => e
 );
 b <= not b after 0.5 * k;

 a <= '0' after 0.25 * k, '1' after 1.75 * k;

 
 stim_proc: process
 begin
 wait for 0.75 * k;
 c <= '0';
 d <= "1100";
 wait for 3 * k;
 c <= '1';
 d <= "0011";
 for i in 1 to 5 loop
 wait until b = '0';
 end loop;
 assert false
 report "[SUCCESS]: simulation finished."
 severity failure;
 end process;
end architecture;