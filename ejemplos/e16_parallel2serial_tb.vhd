library IEEE;
use IEEE.std_logic_1164.all;

entity e16_piso_sr_tb is
end e16_piso_sr_tb;

architecture behavior of e16_piso_sr_tb is 

  constant TEST_DATA: std_logic_vector(7 downto 0) := X"A5";

  -- Component Declaration for the Unit Under Test (UUT)
  component e16_piso_sr
    generic (
      WIDTH: positive
    );
    port (
      CLR_N: in  std_logic;
      CLK  : in  std_logic;
      LOAD : in  std_logic;
      PI   : in  std_logic_vector(WIDTH - 1 downto 0);
      SO   : out std_logic
    );
  end component;

  --Inputs
  signal clr_n: std_logic;
  signal clk  : std_logic;
  signal load : std_logic;
  signal pi   : std_logic_vector(TEST_DATA'range) := TEST_DATA;


  --Outputs
  signal so   : std_logic;
  
  -- Clock period definitions
  constant CLK_PERIOD: time := 10 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;
 
begin

	-- Instantiate the Unit Under Test (UUT)
  uut: e16_piso_sr
    generic map (
      WIDTH => TEST_DATA'length
    )
    port map (
      CLR_N => clr_n,
      CLK   => clk,
      LOAD  => load,
      PI    => pi,
      SO    => so
    );

  -- Clock process
  clk_process: process
  begin
    clk <= '0';
    wait for 0.5 * CLK_PERIOD;
    clk <= '1';
    wait for 0.5 * CLK_PERIOD;
  end process;

  -- Stimulus
  clr_n <= '0' after 0.25 * CLK_PERIOD, '1' after 0.75 * CLK_PERIOD;
  
  load  <= '1' after 0.25 * CLK_PERIOD, '0' after 2.75 * CLK_PERIOD;

  stim_proc: process
  begin
    assert TEST_DATA(0) = '1'
      report "[FAILED]: TEST_DATA LSB must be '1' for testbench to work."
      severity failure;

    -- Check RESET functional
    wait until clr_n = '0';
    wait for DELAY;
    assert so = '0'
      report "[FAILED]: RESET not functional."
      severity failure;

    -- Check RESET dominant over LOAD
    wait until clk = '1';
    wait for DELAY;
    assert so = '0'
      report "[FAILED]: RESET not dominant."
      severity failure;

    -- Check LOAD functional
    wait until clk = '1';
    wait for DELAY;
    assert so = '1'
      report "[FAILED]: LOAD not functional."
      severity failure;

    -- Check LOAD dominant over shift
    wait until clk = '1';
    wait for DELAY;
    assert so = '1'
      report "[FAILED]: LOAD not dominant."
      severity failure;

    -- Check shift
    for i in 1 to TEST_DATA'high loop  
      wait until clk = '1';	
    wait for DELAY;
      assert so = TEST_DATA(i)
        report "[FAILED]: shift failed."
        severity failure;
    end loop;

    -- Check shiftregister empty
    wait until clk = '1';
    wait for DELAY;
    assert so = '0'
      report "[FAILED]: shift failed."
      severity failure;

    wait until clk = '1';

    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;

end;
