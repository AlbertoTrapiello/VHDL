library ieee;
use ieee.std_logic_1164.all;

entity e22_sync_div_tb is
end e22_sync_div_tb;

architecture behavior of e22_sync_div_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e22_sync_div is
    port (
      RESET   : in  std_logic;
      CLK500HZ: in  std_logic;
      CLK1HZ  : out std_logic;
      CLK5HZ  : out std_logic
    );
  end component;

  --Inputs
  signal reset   : std_logic;
  signal clk500Hz: std_logic;

  --Outputs
  signal clk1Hz : std_logic;
  signal clk5Hz : std_logic;

  -- Clock period definitions
  constant clk_period: time := 1 sec / 500;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e22_sync_div
    port map (
      RESET    => reset,
      CLK500Hz => clk500Hz,
      CLK1HZ   => clk1Hz,
      CLK5HZ   => clk5Hz
    );

  -- Clock process definitions
  clk_process :process
  begin
    clk500Hz <= '0';
    wait for 0.5 * clk_period;
    clk500Hz <= '1';
    wait for 0.5 * clk_period;
  end process;

  reset <= '1' after 0.25 * clk_period, '0' after 0.75 * clk_period;
  
  -- Stimulus process
  stim_proc: process
    variable tref: time;
  begin
    wait for 3.5 sec;
    assert false
      report "[SUCCESS]: Simulation finished."
      severity failure;
  end process;
end;
