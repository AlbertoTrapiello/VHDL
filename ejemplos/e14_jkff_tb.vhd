--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:22:44 12/28/2015
-- Design Name:   
-- Module Name:   C:/Users/lcastedo/Documents/pruebas/tema5_4/e12_dlatch_tb.vhd
-- Project Name:  tema5_4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: e12_dlatch
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity e14_jkff_tb is
end e14_jkff_tb;

architecture behavior of e14_jkff_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e14_jkff
    port(
      CLR_N: in  std_logic;
      SET_N: in  std_logic;
      CLK_N: in  std_logic;
      J, K : in  std_logic;
      Q    : out std_logic;
      Q_N  : out std_logic
    );
  end component;

  --Inputs
  signal clr_n: std_logic;
  signal set_n: std_logic;
  signal clk_n: std_logic;
  signal j, k : std_logic;

  --Outputs
  signal q    : std_logic;
  signal q_n  : std_logic;

  constant CLK_PERIOD: time := 10 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e14_jkff
    port map (
      CLR_N => clr_n,
      SET_N => set_n,
      CLK_N => clk_n,
      J     => j,
      K     => k,
      Q     => q,
      Q_N   => q_n
    );

  clk_n_process: process
  begin
    clk_n <= '0';
    wait for 0.5 * CLK_PERIOD;
    clk_n <= '1';
    wait for 0.5 * CLK_PERIOD;
  end process;

  clr_n <= '0' after 0.25 * CLK_PERIOD, '1' after 1.75 * CLK_PERIOD;
  set_n <= '1' after 0.25 * CLK_PERIOD, '0' after 1.25 * CLK_PERIOD, '1' after 2.75 * CLK_PERIOD;
  j     <= '1' after 0.25 * CLK_PERIOD, '0' after 1.75 * CLK_PERIOD, '1' after 3.25 * CLK_PERIOD,
           '0' after 4.25 * CLK_PERIOD, '1' after 5.25 * CLK_PERIOD;
  k     <= '0' after 0.25 * CLK_PERIOD, '1' after 1.75 * CLK_PERIOD, '0' after 3.25 * CLK_PERIOD,
           '0' after 4.25 * CLK_PERIOD, '1' after 5.25 * CLK_PERIOD;

  -- Stimulus process
  stim_proc: process
  begin
    -- Check CLR_N functional
    wait until clr_n = '0';
    wait for DELAY;
    assert q = '0' and q_n = '1'
      report "[FAILED]: CLR_N malfunction."
      severity failure;

    -- Check CLR_N precedence over CLK_N
    wait until clk_n = '0';
    wait for DELAY;
    assert q = '0' and q_n = '1'
      report "[FAILED]: CLR_N has no priority over CLK_N."
      severity failure;

    -- Check CLR_N precedence over SET_N
    wait until set_n = '0';
    wait for DELAY;
    assert q = '0' and q_n = '1'
      report "[FAILED]: CLR_N has no priority over SET_N."
      severity failure;

    -- Check SET_N functional
    wait until clr_n = '1';
    wait for DELAY;
    assert q = '1' and q_n = '0'
      report "[FAILED]: SET_N malfunction."
      severity failure;

    -- Check SET_N precedence over CLK_N
    wait until clk_n = '0';
    wait for DELAY;
    assert q = '1' and q_n = '0'
      report "[FAILED]: SET_N has no priority over CLK_N."
      severity failure;

    -- Check edge-active
    wait until set_n = '1';
    wait until clk_n = '0';
    wait for DELAY;
    assert q = '0' and q_n = '1'
      report "[FAILED]: Q should be '0' when JK = 01."
      severity failure;
    wait until j = '1';
    wait until clk_n = '0';
    assert q'stable(CLK_PERIOD)
      report "[FAILED]: should not be level sensitive."
      severity failure;
    wait for DELAY;
    assert q = '1' and q_n = '0'
      report "[FAILED]: Q should be '1' when JK = '10'."
      severity failure;
    wait until j = '0';
    wait until clk_n = '0';
    wait for DELAY;
    assert q = '1' and q_n = '0'
      report "[FAILED]: Q should remain '1' when JK = '00'."
      severity failure;
    wait until j = '1';
    wait until clk_n = '0';
    wait for DELAY;
    assert q = '0' and q_n = '1'
      report "[FAILED]: Q should toggle to '0' when JK = '11'."
      severity failure;
      
    assert false
      report "[PASSED]: simulation finished."
      severity failure;
  end process;

end;
