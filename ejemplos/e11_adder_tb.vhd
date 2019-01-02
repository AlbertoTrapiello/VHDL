library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity e11_adder_tb is
end e11_adder_tb;
 
architecture behavioral of e11_adder_tb is 

  component e11_adder is
    generic (
      WIDTH: positive
    );
    port (
      A : in  signed(WIDTH - 1 downto 0);
      B : in  signed(WIDTH - 1 downto 0);
      CI: in  std_logic;
      S : out signed(WIDTH - 1 downto 0);
      CO: out std_logic
    );
  end component;

  subtype nibble is signed(3 downto 0);
  
  --Inputs
  signal a : nibble;
  signal b : nibble;
  signal ci: std_logic;

  --Outputs
  signal s1, s2 : nibble;
  signal co1, co2: std_logic;

  constant clk_period: time := 10 ns;

  for uut1: e11_adder use entity work.e11_adder(structural);
  for uut2: e11_adder use entity work.e11_adder(dataflow);

begin
  -- Instantiate the Unit Under Test (UUT)
  uut1: e11_adder
    generic map (
      WIDTH => nibble'length
    )
    port map (
      A  => a,
      B  => b,
      CI => ci,
      S  => s1,
      CO => co1
    );

  uut2: e11_adder
    generic map (
      WIDTH => nibble'length
    )
    port map (
      A  => a,
      B  => b,
      CI => ci,
      S  => s2,
      CO => co2
    );

  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 100 ns.
    wait for clk_period;
    a  <= to_signed(1, a'length);
    b  <= to_signed(1, b'length);
    ci <= '0';
    wait for 0.1 * clk_period;
    assert (s1 = s2) and (co1 = co2) and to_integer(s1) = 2
      report "[FAILURE]: result should be 2"
      severity error;
    wait for 0.9 * clk_period;	
    a  <= to_signed(1, a'length);
    b  <= to_signed(2, b'length);
    ci <= '1';
    wait for 0.1 * clk_period;
    assert (s1 = s2) and (co1 = co2) and to_integer(s1) = 4
      report "[FAILURE]: result should be 4"
      severity error;
    wait for 0.9 * clk_period;	
    a  <= to_signed(-1, a'length);
    b  <= to_signed(-1, b'length);
    ci <= '0';
    wait for 0.1 * clk_period;
    assert (s1 = s2) and (co1 = co2) and to_integer(s1) = -2
      report "[FAILURE]: result should be -2"
      severity error;
    wait for 0.9 * clk_period;	
    a  <= to_signed( 4, a'length);
    b  <= to_signed(-3, b'length);
    ci <= '0';
    wait for 0.1 * clk_period;
    assert (s1 = s2) and (co1 = co2) and to_integer(s1) = 1
      report "[FAILURE]: result should be 1"
      severity error;
    wait for 0.9 * clk_period;	

    assert false
      report "[PASSED]: simulation finished."
      severity failure;
  end process;
end;
