library IEEE;
use IEEE.std_logic_1164.all;

-- D flip-flop
entity e13_dff is
  port (
    CLR_N: in  std_logic;
    SET_N: in  std_logic;
    CLK_N: in  std_logic;
    D    : in  std_logic;
    Q    : out std_logic;
    Q_N  : out std_logic
  );
end e13_dff;

architecture behavioral of e13_dff is
  signal q_i: std_logic;
begin
  process (CLR_N, SET_N, CLK_N)
  begin
    if CLR_N = '0' then
      q_i <= '0';
    elsif SET_N = '0' then
      q_i <= '1';
    elsif CLK_N'event and CLK_N = '0' then
      q_i <= D;
    end if;
  end process;
  Q   <= q_i;
  Q_N <= not q_i;
end behavioral;
