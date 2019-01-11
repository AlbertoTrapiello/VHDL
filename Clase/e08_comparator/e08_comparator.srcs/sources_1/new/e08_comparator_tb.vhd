library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity e08_comparator_tb is
end e08_comparator_tb;
 
architecture behavioral of e08_comparator_tb is 

  component e08_comparator is
    generic (
      WIDTH: positive
    );
    port (
      A     : in  std_logic_vector (WIDTH - 1 downto 0);
      B     : in  std_logic_vector (WIDTH - 1 downto 0);
      A_LT_B: out std_logic;
      A_EQ_B: out std_logic;
      A_GT_B: out std_logic
    );
  end component;

  type test_pair is record
    a     : integer;
    b     : integer;
    result: std_logic_vector(2 downto 0);
  end record;

  type test_pair_vector is array(natural range <>) of test_pair;

  constant TEST_SUITE: test_pair_vector := (
    ( 1,  2, "100"),
    ( 2, -3, "001"),
    ( 5,  5, "010"),
    (-2, -3, "001")
  );

  subtype nibble is std_logic_vector(3 downto 0);
  
  --Inputs
  signal a     : nibble;
  signal b     : nibble;

  --Outputs
  signal a_lt_b: std_logic;
  signal a_eq_b: std_logic;
  signal a_gt_b: std_logic;

  constant CLK_PERIOD: time := 100 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;

  for uut1: e08_comparator use entity work.e08_comparator(dataflow);
  for uut2: e08_comparator use entity work.e08_comparator(behavioral);
  
begin
  -- Instantiate the Unit Under Test (UUT)
  uut1: e08_comparator
    generic map (
      WIDTH => nibble'length
    )
    port map (
      A      => a,
      B      => b,
      A_LT_B => a_lt_b,
      A_EQ_B => a_eq_b,
      A_GT_B => a_gt_b
    );

  uut2: e08_comparator
    generic map (
      WIDTH => nibble'length
    )
    port map (
      A  => a,
      B  => b,
      A_LT_B => a_lt_b,
      A_EQ_B => a_eq_b,
      A_GT_B => a_gt_b
    );

  -- Stimulus process
  stim_proc: process
  begin
    for i in TEST_SUITE'range loop
      a  <= std_logic_vector(to_signed(TEST_SUITE(i).a, a'length));
      b  <= std_logic_vector(to_signed(TEST_SUITE(i).b, b'length));
      wait for DELAY;
      assert a_lt_b & a_eq_b & a_gt_b = TEST_SUITE(i).result
        report "[FAILED]: comparator malfunction."
        severity failure;
      wait for CLK_PERIOD - DELAY;
    end loop;

    assert false
      report "[PASSED]: simulation finished."
      severity failure;
  end process;
end;
