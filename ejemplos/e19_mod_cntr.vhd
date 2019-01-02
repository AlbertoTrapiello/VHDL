library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

-- Synchronous arbitrary module up counter
entity e19_mod_cntr is
  generic (
    MODULE: positive := 10
  );
  port (
    CLR_N: in  std_logic;
    CLK  : in  std_logic;
    Q    : out std_logic_vector(integer(ceil(log2(real(MODULE)))) - 1 downto 0)
  );
end e19_mod_cntr;

architecture behavioral of e19_mod_cntr is
begin
  process (CLR_N, CLK)
    variable count: integer range 0 to MODULE - 1;
  begin
    if CLR_N = '0' then
      count := 0;
    elsif rising_edge(CLK) then
      if count < MODULE - 1 then
        count := count + 1;
      else
        count := 0;
      end if;
    end if;
    Q <= std_logic_vector(to_unsigned(count, Q'length));
  end process;
end behavioral;
