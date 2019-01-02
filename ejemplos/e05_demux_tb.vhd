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
 
entity e05_demux_tb is
end e05_demux_tb;
 
architecture behavior of e05_demux_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e05_demux is
  port (
    SEL : in  std_logic_vector(1 downto 0);
    DIN : in  std_logic;
    DOUT: out std_logic_vector(0 to 3)
  );
  end component;

  --Inputs
  signal sel : std_logic_vector(1 downto 0);
  signal din : std_logic := '1';

  --Output
  signal dout: std_logic_vector(0 to 3);
  
  -- Clocks period
  constant CLK_PERIOD: time := 10 ns;
  constant DELAY     : time := 0.1 * CLK_PERIOD;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e05_demux
    port map (
      SEL  => sel,
      DIN  => din,
      DOUT => dout
    );

  -- Stimulus process
  stim_proc: process
  begin
    for i in 0 to 3 loop  
      sel <= std_logic_vector(to_signed(i, sel'length));
      wait for DELAY;
      assert unsigned(dout) = shift_right("1000", i)
        report "[FAILED]: demux malfunction."
        severity failure;
      wait for CLK_PERIOD - DELAY;
    end loop;

    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;
end;
