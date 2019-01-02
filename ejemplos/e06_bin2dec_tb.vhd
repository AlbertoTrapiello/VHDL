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
use IEEE.numeric_std.all;
 
entity e06_bin2dec_tb is
end e06_bin2dec_tb;
 
architecture behavior of e06_bin2dec_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e06_bin2dec is
  port (
    A: in  std_logic_vector (3 downto 0);
    Y: out std_logic_vector (9 downto 0)
  );
  end component;

  --Inputs
  signal a: std_logic_vector (3 downto 0);

  --Output
  signal y: std_logic_vector (9 downto 0);
  
  -- Clocks period
  constant CLK_PERIOD: time := 10 ns;
  constant DELAY     : time := 0.1 * CLK_PERIOD;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e06_bin2dec
    port map (
      A => a,
      Y => y
    );

  -- Stimulus process
  stim_proc: process
  begin
    for i in 0 to 15 loop  
      a <= std_logic_vector(to_signed(i, a'length));
      wait for DELAY;
      assert unsigned(y) = shift_left("0000000001", i)
        report "[FAILED]: decoder malfunction."
        severity failure;
      wait for CLK_PERIOD - DELAY;
    end loop;

    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;
end;
