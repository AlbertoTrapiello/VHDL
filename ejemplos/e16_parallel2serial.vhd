library IEEE;
use IEEE.std_logic_1164.all;

-- Parallel Input Serial Output Shift Register
entity e16_piso_sr is
  generic (
    WIDTH: positive := 4
  );
  port (
    CLR_N: in  std_logic;
    CLK  : in  std_logic;
    LOAD : in  std_logic;
    PI   : in  std_logic_vector(WIDTH - 1 downto 0);
    SO   : out std_logic
  );
end e16_piso_sr;

architecture behavioral of e16_piso_sr is
  signal reg: std_logic_vector(WIDTH - 1 downto 0);
begin
  process(CLR_N, CLK)
  begin
    if CLR_N = '0' then
      reg <= (others => '0');
    elsif CLK'event and CLK = '1' then
      if LOAD = '1' then
        reg <= PI;
      else
        reg <= '0' & reg(reg'left downto 1);
      end if;
    end if;
  end process;
  SO <= reg(0);
end behavioral;
