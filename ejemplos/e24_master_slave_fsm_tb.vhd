library ieee;
use ieee.std_logic_1164.all;
 
entity e24_control_unit_tb is
end e24_control_unit_tb;
 
architecture behavior of e24_control_unit_tb is 
 
  -- Component Declaration for the Unit Under Test (UUT)
  component e24_control_unit
    port(
      reset     : in  std_logic;
      clk       : in  std_logic;
      pushbutton: in  std_logic;
      light     : out std_logic
    );
  end component;
    

  --Inputs
  signal reset     : std_logic;
  signal clk       : std_logic;
  signal pushbutton: std_logic;

  --Outputs
  signal light     : std_logic;

  -- Clock period definitions
  constant clk_period: time := 10 ns;
 
begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e24_control_unit port map (
    reset      => reset,
    clk        => clk,
    pushbutton => pushbutton,
    light      => light
  );

  -- Clock process definitions
  clk_process: process
  begin
    clk <= '0';
    wait for 0.5 * clk_period;
    clk <= '1';
    wait for 0.5 * clk_period;
  end process;

  reset <= '1' after 0.25 * clk_period, '0' after 0.75 * clk_period;

  pushbutton <= '0' after 0.25 * clk_period, '1' after 1.25 * clk_period,
                '0' after 1.75 * clk_period;
  
  -- Stimulus process
  stim_proc: process
  begin
    wait for 20 * clk_period;
     assert false
       report "[SUCCESS]: Simulation finished."
       severity failure;
  end process;
end;
