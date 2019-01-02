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

entity e12_dlatch_tb is
end e12_dlatch_tb;

architecture behavior of e12_dlatch_tb is 

  -- Component Declaration for the Unit Under Test (UUT)
  component e12_dlatch
    generic (
      WIDTH: positive
    );
    port(
      D: in  std_logic_vector(3 downto 0);
      G: in  std_logic;
      Q: out std_logic_vector(3 downto 0)
    );
  end component;

  --Inputs
  signal d   : std_logic_vector(3 downto 0);
  signal g   : std_logic;

  --Outputs
  signal q   : std_logic_vector(3 downto 0);

  signal daux: std_logic_vector(3 downto 0);

  constant CLK_PERIOD: time := 10 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: e12_dlatch
    generic map (
      WIDTH => 4
    )
    port map (
      D => d,
      G => g,
      Q => q
    );

  g_process: process
  begin
    g <= '0';
    wait for 0.5 * CLK_PERIOD;
    g <= '1';
    wait for 0.5 * CLK_PERIOD;
  end process;

  daux_process: process
  begin
    daux <= "0101";
    wait for 0.25 * CLK_PERIOD;
    daux <= "1010";
    wait for 0.25 * CLK_PERIOD;
  end process;

  d <= daux'delayed(0.125 * CLK_PERIOD);

  -- Stimulus process
  stim_proc: process
  begin
    wait until g = '1';
    assert q'stable(0.5 * CLK_PERIOD)
      report "[FAILED]: Q shouldn't change when G = '0'."
      severity failure;
    for i in 1 to 3 loop
      if i /= 1 then
        wait on d;
      end if;
      wait for DELAY;
      assert q = d
        report "[FAILED]: Q should follow D when G = '1'."
        severity failure;
    end loop;
    wait until g = '0';
    wait until g = '1';
    assert q'stable(0.5 * CLK_PERIOD)
      report "[FAILED]: Q shouldn't change when G = '0'."
      severity failure;

    assert false
      report "[PASSED]: simulation finished."
      severity failure;
  end process;

end;
