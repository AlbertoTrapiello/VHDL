library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Synchronous binary up counter
entity e18_bin_cntr is
  generic (
    WIDTH: positive := 4
  );
  port (
    CLK    : in  std_logic;
    RESET_N: in  std_logic;
    Q      : out std_logic_vector (WIDTH - 1 downto 0)
  );
end e18_bin_cntr;

architecture behavioral of e18_bin_cntr is
  signal q_i: unsigned(Q'range);
begin
  process (CLK, RESET_N)
  begin
    if RESET_N = '0' then
      q_i <= (others => '0');
    elsif rising_edge(CLK) then
      q_i <= q_i + 1;
    end if;
  end process;
  Q <= std_logic_vector(q_i);
end behavioral;
