library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity e18_bin_cntr_tb is
end e18_bin_cntr_tb;
 
architecture behavior of e18_bin_cntr_tb is 
 
  -- Component Declaration for the Unit Under Test (UUT)
  component e18_bin_cntr
    generic (
      WIDTH: positive
    );
    port(
      CLK    : in  std_logic;
      RESET_N: in  std_logic;
      Q      : out std_logic_vector(WIDTH - 1 downto 0)
    );
  end component;
 
  -- Data width
  constant counter_width: positive := 4;  
  constant counter_states: positive := 2**counter_width;  

  --Inputs
  signal clk: std_logic;
  signal reset_n: std_logic;

  --Outputs
  signal q: std_logic_vector(counter_width - 1 downto 0);

  -- Clock period definitions
  constant clk_period: time := 100 ns;
  constant delay: time := 0.1 * clk_period;

begin
	-- Instantiate the Unit Under Test (UUT)
  uut: e18_bin_cntr
    generic map (
      WIDTH => counter_width
    )
    port map (
      CLK     => clk,
      RESET_N => reset_n,
      Q       => q
    );

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for 0.5 * clk_period;
    clk <= '1';
    wait for 0.5 * clk_period;
  end process;

  -- Stimulus process
  stim_proc: process
  begin
    -- Check reset_n clears output
    wait for 0.25 * clk_period;	
    reset_n <= '0';
    wait for delay;	
    assert to_integer(unsigned(q)) = 0
      report "[FAILURE]: Reset not functional"
      severity failure;

    -- Check reset_n has priority over clk
    wait until clk = '1';	
    wait for delay;	
    assert to_integer(unsigned(q)) = 0
      report "[FAILURE]: Reset not functional."
      severity failure;



    -- Check count sequence
    wait until clk = '0';	
    reset_n <= '1';
    for i in 1 to counter_states loop
      wait until clk = '1';	
      wait for delay;	
      assert to_integer(unsigned(q)) = i mod counter_states
        report "[FAILURE]: Wrong count."
        severity failure;
    end loop;

    -- Terminate testbench
    assert false
      report "[OK]: Simulation finished."
      severity failure;
  end process;
end;
