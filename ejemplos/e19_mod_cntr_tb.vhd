library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
 
entity e19_mod_cntr_tb is
end e19_mod_cntr_tb;
 
architecture behavior of e19_mod_cntr_tb is 
 
  -- Component Declaration for the Unit Under Test (UUT)
  component e19_mod_cntr
  generic (
    MODULE: positive := 10
  );
  port (
    CLR_N: in  std_logic;
    CLK  : in  std_logic;
    Q    : out std_logic_vector(integer(ceil(log2(real(MODULE)))) - 1 downto 0)
    );
  end component;
 
  -- Data width
  constant COUNTER_MODULE: positive := 10;  
  constant COUNTER_WIDTH : positive := integer(ceil(log2(real(COUNTER_MODULE))));  

  --Inputs
  signal clk  : std_logic;
  signal clr_n: std_logic;

  --Outputs
  signal q    : std_logic_vector(COUNTER_WIDTH - 1 downto 0);

  -- Clock period definitions
  constant CLK_PERIOD: time := 100 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;

begin
	-- Instantiate the Unit Under Test (UUT)
  uut: e19_mod_cntr
    generic map (
      MODULE => 10
    )
    port map (
      CLR_N => clr_n,
      CLK   => clk,
      Q     => q
    );

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for 0.5 * CLK_PERIOD;
    clk <= '1';
    wait for 0.5 * CLK_PERIOD;
  end process;

  -- Stimulus process
  stim_proc: process
  begin
    -- Check reset_n clears output
    wait for 0.25 * CLK_PERIOD;	
    clr_n <= '0';
    wait for DELAY;	
    assert to_integer(unsigned(q)) = 0
      report "[FAILURE]: Reset not functional"
      severity failure;

    -- Check reset_n has priority over clk
    wait until clk = '1';	
    wait for DELAY;	
    assert to_integer(unsigned(q)) = 0
      report "[FAILURE]: Reset not functional."
      severity failure;

    -- Check count sequence
    wait until clk = '0';	
    clr_n <= '1';
    for i in 1 to COUNTER_MODULE loop
      wait until clk = '1';	
      wait for delay;	
      assert to_integer(unsigned(q)) = i mod COUNTER_MODULE
        report "[FAILURE]: Wrong count."
        severity failure;
    end loop;

    wait until clk = '1';	

    -- Terminate testbench
    assert false
      report "[OK]: Simulation finished."
      severity failure;
  end process;
end;
