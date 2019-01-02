library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity e11_adder is
  generic (
    WIDTH: positive := 4
  );
  port (
    A : in  signed(WIDTH - 1 downto 0);
    B : in  signed(WIDTH - 1 downto 0);
    CI: in  std_logic;
    S : out signed(WIDTH - 1 downto 0);
    CO: out std_logic
  );
end e11_adder;

architecture structural of e11_adder is
  component e10_full_adder is
    port (
      A : in  std_logic;
      B : in  std_logic;
      CI: in  std_logic;
      S : out std_logic;
      CO: out std_logic
    );
  end component;

  signal carry: std_logic_vector(WIDTH downto 0);
begin
  carry(0) <= CI;
  adder0: for i in 0 to WIDTH - 1 generate
  begin
    fa_i: e10_full_adder port map (
        A  => A(i),
        B  => B(i),
        CI => carry(i),
        S  => S(i),
        CO => carry(i + 1)
      );
  end generate;
  CO <= carry(WIDTH);
end structural;

architecture dataflow of e11_adder is
  signal ci_i : signed(WIDTH downto 0);
  signal s_i  : signed(WIDTH downto 0);
  alias rslt  is s_i(WIDTH - 1 downto 0);
  alias carry is s_i(WIDTH);
begin
  ci_i(WIDTH downto 1) <= (others => '0');
  ci_i(0) <= CI;
  s_i  <= ('0' & A) + ('0' & B) + ci_i;
  S    <= rslt;
  CO   <= carry;
end dataflow;
