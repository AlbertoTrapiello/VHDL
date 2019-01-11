
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Signed integer comparator
entity e08_comparator is
  generic (
    WIDTH: positive := 4
  );
  port (
    A     : in  std_logic_vector (WIDTH - 1 downto 0);
    B     : in  std_logic_vector (WIDTH - 1 downto 0);
    A_LT_B: out std_logic;
    A_EQ_B: out std_logic;
    A_GT_B: out std_logic
  );
end e08_comparator;

architecture dataflow of e08_comparator is
begin
  A_LT_B <= '1' when signed(A) < signed(B) else
            '0';

  A_EQ_B <= '1' when signed(A) = signed(B) else
            '0';

  A_GT_B <= '1' when signed(A) > signed(B) else
            '0';
end dataflow;

architecture behavioral of e08_comparator is
begin
  process (A, B)
  begin
    A_LT_B <= '0';
    A_EQ_B <= '0';
    A_GT_B <= '0';
    if signed(A) < signed(B) then
      A_LT_B <= '1';
    elsif signed(A) > signed(B) then
      A_GT_B <= '1';
    else
      A_EQ_B <= '1';
    end if;
  end process;
end behavioral;
