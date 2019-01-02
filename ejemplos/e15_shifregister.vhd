library ieee;
use ieee.std_logic_1164.all;

-- Serial In Serial Out Shift Register
entity e15_siso_sr is
  generic (
    WIDTH: positive := 4
  );
  port (
    CLR_N: in  std_logic;
    CLK_N: in  std_logic;
    SI   : in  std_logic;
    SO   : out std_logic
  );
end e15_siso_sr;

architecture behavioral of e15_siso_sr is
  signal reg: std_logic_vector(WIDTH - 1 downto 0);
begin
  process(CLR_N, CLK_N)
  begin
    if CLR_N = '0' then
      reg <= (others => '0');
    elsif CLK_N'event and CLK_N = '0' then 
      reg <= SI & reg(reg'left downto 1);
    end if;
  end process;
  SO <= reg(0);
end behavioral;
