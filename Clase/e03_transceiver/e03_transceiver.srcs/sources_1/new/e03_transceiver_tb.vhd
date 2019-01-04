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
 
entity e03_transceiver_tb is
end e03_transceiver_tb;
 
architecture behavior of e03_transceiver_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e03_transceiver is
    generic (
      WIDTH: positive
    );
    port (
      DIR: in    std_logic;
      A  : inout std_logic_vector(WIDTH - 1 downto 0);
      B  : inout std_logic_vector(WIDTH - 1 downto 0)
    );
  end component;

  constant BUS_WIDTH: positive := 4;

  --Inputs
  signal dir: std_logic;

  --Bidirectional
  signal a  : std_logic_vector(BUS_WIDTH - 1 downto 0);
  signal b  : std_logic_vector(BUS_WIDTH - 1 downto 0);

  -- Clocks period
  constant CLK_PERIOD : time := 10 ns;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e03_transceiver
    generic map (
      WIDTH => BUS_WIDTH
    )
    port map (
      DIR => dir,
      A   => a,
      B   => b
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Transmit to B  
    dir <= '0';
    b   <= (others => 'Z');
    a   <= (others => '0');
    wait for CLK_PERIOD;
    a   <= (others => '1');
    wait for CLK_PERIOD;

    -- Receive from B  
    dir <= '1';
    a   <= (others => 'Z');
    b   <= (others => '0');
    wait for CLK_PERIOD;
    b   <= (others => '1');
    wait for CLK_PERIOD;

    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;
end;
