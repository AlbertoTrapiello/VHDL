library IEEE;
use IEEE.std_logic_1164.all;

-- D flip-flop
entity e14_jkff is
  port (
    CLR_N: in  std_logic;
    SET_N: in  std_logic;
    CLK_N: in  std_logic;
    J, K : in  std_logic;
    Q    : out std_logic;
    Q_N  : out std_logic
  );
end e14_jkff;

architecture behavioral of e14_jkff is
  signal jk: std_logic_vector(1 downto 0);
  signal q_i: std_logic;
begin
  jk <= J & K;
  process (CLR_N, SET_N, CLK_N)
  begin
    if CLR_N = '0' then
      q_i <= '0';
    elsif SET_N = '0' then
      q_i <= '1';
    elsif CLK_N'event and CLK_N = '0' then
      case jk is
        when "01" =>
          q_i <= '0';
        when "10" =>
          q_i <= '1';
        when "11" =>
          q_i <= not q_i;
        when others =>
          q_i <= q_i;
      end case;
    end if;
  end process;
  Q   <= q_i;
  Q_N <= not q_i;
end behavioral;
