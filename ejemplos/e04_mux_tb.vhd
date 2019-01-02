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
use IEEE.math_real.all;

use work.e04_mux_pkg.all;
 
entity e04_mux_tb is
end e04_mux_tb;
 
architecture behavior of e04_mux_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e04_mux is
    generic (
      FANIN: positive
    );
    port (
      A: in  mux_bus_vector(0 to FANIN - 1);
      S: in  std_logic_vector(integer(ceil(log2(real(FANIN)))) - 1 downto 0);
      Y: out mux_bus
    );
  end component;

  --Inputs
  signal a: mux_bus_vector(0 to 3) := (X"33", X"55", X"AA", X"FF");
  signal s: std_logic_vector(1 downto 0);

  --Output
  signal y: mux_bus;

  -- Clocks period
  constant CLK_PERIOD: time := 10 ns;
  constant DELAY     : time := 0.1 * CLK_PERIOD;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e04_mux
    generic map (
      FANIN => 4
    )
    port map (
      A => a,
      S => s,
      Y => y
    );

  -- Stimulus process
  stim_proc: process
  begin
    for i in 0 to 3 loop  
      s <= std_logic_vector(to_signed(i, s'length));
      wait for DELAY;
      assert y = a(i)
        report "[FAILED]: mux malfunction."
        severity failure;
      wait for CLK_PERIOD - DELAY;
    end loop;

    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;
end;
