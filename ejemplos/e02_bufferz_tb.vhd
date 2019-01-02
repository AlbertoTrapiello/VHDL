--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:46:14 12/28/2015
-- Design Name:   
-- Module Name:   C:/Users/lcastedo/Documents/pruebas/tema5_4/e02_bufferz_tb.vhd
-- Project Name:  tema5_4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: e02_bufferz
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
entity e02_bufferz_tb is
end e02_bufferz_tb;
 
architecture behavior of e02_bufferz_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e02_bufferz
    port(
      A   : in  std_logic;
      OE_N: in  std_logic;
      B   : out std_logic
    );
  end component;

  --Inputs
  signal a   : std_logic;
  signal oe_n: std_logic;

  --Outputs
  signal b   : std_logic;

  -- Clocks period
  constant CLK_PERIOD : time := 10 ns;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e02_bufferz
    port map (
      A    => a,
      OE_N => oe_n,
      B    => b
    );

  -- Stimulus process
  stim_proc: process
  begin		
    oe_n <= '0';
    a    <= '0';
    wait for CLK_PERIOD;
    oe_n <= '1';
    wait for CLK_PERIOD;
    oe_n <= '0';
    a    <= '1';
    wait for CLK_PERIOD;
    oe_n <= '1';
    wait for CLK_PERIOD;
    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;
end;
