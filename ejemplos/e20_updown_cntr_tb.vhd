--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:57:11 12/30/2015
-- Design Name:   
-- Module Name:   C:/Users/lcastedo/Documents/pruebas/tema5_4/e20_updown_cntr_tb.vhd
-- Project Name:  tema5_4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: e20_updown_cntr
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
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
entity e20_updown_cntr_tb is
end e20_updown_cntr_tb;
 
architecture behavior of e20_updown_cntr_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e20_updown_cntr
    generic (
      WIDTH: positive
    );
    port(
      CLR_N : in  std_logic;
      CLK   : in  std_logic;
      UP    : in  std_logic;
      CE_N  : in  std_logic;
      LOAD_N: in  std_logic;
      J     : in  std_logic_vector(3 downto 0);
      ZERO_N: out std_logic;
      Q     : out std_logic_vector(3 downto 0)
    );
  end component;

  --Inputs
  signal clr_n : std_logic;
  signal clk   : std_logic;
  signal up    : std_logic;
  signal ce_n  : std_logic;
  signal load_n: std_logic;
  signal j     : std_logic_vector(3 downto 0) := X"5";

  --Outputs
  signal zero_n: std_logic;
  signal q     : std_logic_vector(3 downto 0);

  -- Clock period definitions
  constant CLK_PERIOD: time := 10 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;

begin
 
	-- Instantiate the Unit Under Test (UUT)
  uut: e20_updown_cntr
    generic map (
      WIDTH => q'length
    )
    port map (
      CLR_N  => clr_n,
      CLK    => clk,
      UP     => up,
      CE_N   => ce_n,
      LOAD_N => load_n,
      J      => j,
      ZERO_N => zero_n,
      Q      => q
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
  clr_n  <= '0' after 0.25 * CLK_PERIOD, '1' after 0.75 * CLK_PERIOD;
  load_n <= '0' after 0.25 * CLK_PERIOD, '1' after 1.75 * CLK_PERIOD;
  up     <= '0' after 0.25 * CLK_PERIOD, '1' after 7.25 * CLK_PERIOD;
  ce_n   <= '0' after 0.25 * CLK_PERIOD, '1' after 7.25 * CLK_PERIOD,
            '0' after 8.25 * CLK_PERIOD;

  stim_proc: process
  begin
    -- Check CLR_N
    wait until clr_n = '0';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 0
      report "[FAILED]: CLR_N malfunction."
      severity failure;
    wait until clk = '1';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 0
      report "[FAILED]: CLR_N malfunction."
      severity failure;

    -- Check LOAD_N
    wait until clr_n = '1';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 5
      report "[FAILED]: LOAD_N malfunction."
      severity failure;
    wait until clk = '1';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 5
      report "[FAILED]: LOAD_N malfunction."
      severity failure;

    -- Check countdown
    wait until load_n = '1';
    for i in 4 downto 1 loop
      wait until clk = '1';
      wait for DELAY;
      assert zero_n = '1' and to_integer(unsigned(q)) = i
        report "[FAILED]: countdown malfunction."
        severity failure;
    end loop;      
    wait until clk = '1';
    wait for DELAY;
    assert zero_n = '0' and to_integer(unsigned(q)) = 0
      report "[FAILED]: countdown malfunction."
      severity failure;

    -- Check CE_N
    wait until clk = '1';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 0
      report "[FAILED]: CE_N malfunction."
      severity failure;

    -- Check countup
    for i in 1 to 4 loop
      wait until clk = '1';
      wait for DELAY;
      assert zero_n = '1' and to_integer(unsigned(q)) = i
        report "[FAILED]: countup malfunction."
        severity failure;
    end loop;      

    -- insert stimulus here 

    assert false
      report "[SUCCESS]: Simulation finished."
      severity failure;
  end process;

end;
