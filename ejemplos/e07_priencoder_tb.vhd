--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:05:20 11/19/2015
-- Design Name:   
-- Module Name:   C:/Users/lcastedo/Documents/pruebas/tema5_4/priencoder_tb.vhd
-- Project Name:  tema5_4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: priencoder
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
library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

entity e07_priencoder_tb is
end e07_priencoder_tb;

architecture behavior of e07_priencoder_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e07_priencoder
    port(
      IRQ_N: in  std_logic_vector(6 downto 0);
      INT_N: out std_logic_vector(2 downto 0)
    );
  end component;

  type test_pair is record
    stimulus: std_logic_vector(6 downto 0);
    result  : std_logic_vector(2 downto 0);
  end record;

  type test_pair_vector is array(natural range <>) of test_pair;

  constant TEST_SUITE: test_pair_vector := (
    ("1111101", "101"),
    ("1111110", "110"),
    ("1110110", "011"),
    ("1111111", "111")
  );
  
  --Inputs
  signal irq_n: std_logic_vector(6 downto 0);

  --Outputs
  signal int_n: std_logic_vector(2 downto 0);

  constant CLK_PERIOD: time := 100 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e07_priencoder
    port map (
      IRQ_N => irq_n,
      INT_N => int_n
    );

  -- Stimulus process
  stim_proc: process
  begin
    for i in TEST_SUITE'range loop
      irq_n <= TEST_SUITE(i).stimulus;
      wait for DELAY;
      assert int_n = TEST_SUITE(i).result
        report "[FAILED]: encoder malfunction."
        severity failure;
      wait for CLK_PERIOD - DELAY;
    end loop;

    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;
end;
