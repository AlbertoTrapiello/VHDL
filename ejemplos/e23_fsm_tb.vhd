--------------------------------------------------------------------------------
-- Company: 
library IEEE;
use IEEE.std_logic_1164.all;

entity e23_fsm_tb is
end e23_fsm_tb;

architecture behavior of e23_fsm_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e23_fsm
    port(
      RESET     : in  std_logic;
      CLK       : in  std_logic;
      PUSHBUTTON: in  std_logic;
      LIGHT     : out std_logic
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
  uut: e23_fsm
    port map (
      RESET      => reset,
      CLK        => clk,
      PUSHBUTTON => pushbutton,
      LIGHT      => light
    );

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for 0.5 * clk_period;
    clk <= '1';
    wait for 0.5 * clk_period;
  end process;

  reset <= '1' after 0.25 * clk_period, '0' after 0.75 * clk_period;

  -- Stimulus process
  stim_proc: process
  begin
    pushbutton <= '0';
    wait for 2.25 * clk_period;

    pushbutton <= '1';
    wait for 2 * clk_period;

    pushbutton <= '0';
    wait for 2 * clk_period;

    pushbutton <= '1';
    wait for 2 * clk_period;

    pushbutton <= '0';
    wait for 2 * clk_period;

    assert false
      report "[SUCCESS]: simulation finished."
      severity failure;
  end process;
end;
