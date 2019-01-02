library IEEE;
use IEEE.std_logic_1164.all;

entity e15_siso_sr_tb is
end e15_siso_sr_tb;

architecture behavior of e15_siso_sr_tb is 

  constant TEST_DATA: std_logic_vector(7 downto 0) := X"A5";

  -- Component Declaration for the Unit Under Test (UUT)
  component e15_siso_sr
    generic (
      WIDTH: positive
    );
    port (
      CLR_N: in  std_logic;
      CLK_N: in  std_logic;
      SI   : in  std_logic;
      SO   : out std_logic
    );
  end component;

  --Inputs
  signal clr_n: std_logic;
  signal clk_n: std_logic;
  signal si   : std_logic;

  --Outputs
  signal so   : std_logic;
  
  -- Clock period definitions
  constant CLK_PERIOD: time := 10 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;
 
begin

	-- Instantiate the Unit Under Test (UUT)
  uut: e15_siso_sr
    generic map (
      WIDTH => TEST_DATA'length
    )
    port map (
      CLR_N => clr_n,
      CLK_N => clk_n,
      SI    => si,
      SO    => so
    );

  -- Clock process
  clk_n_process: process
  begin
    clk_n <= '0';
    wait for 0.5 * CLK_PERIOD;
    clk_n <= '1';
    wait for 0.5 * CLK_PERIOD;
  end process;

  -- Stimulus
  clr_n <= '0' after 0.25 * clk_period, '1' after 1.25 * clk_period;
  
  stim_proc: process
  begin
    si <= TEST_DATA(0);
    wait until clr_n = '1';
    for i in TEST_DATA'range loop  
      si <= TEST_DATA(i);
      wait until clk_n = '0';	
    end loop;
    si <= '0';
    wait;
  end process;

  check_proc: process
  begin
    -- Check RESET functional 
    wait until clr_n = '0';
    wait for DELAY;
    assert so = '0'
      report "[FAILED]: RESET not functional."
      severity failure;
    wait until clr_n = '1';
    for i in 1 to TEST_DATA'length - 1 loop  
      wait until clk_n = '0';	
      wait for DELAY;
      assert so = '0'
        report "[FAILED]: RESET not functional."
        severity failure;
    end loop;

    -- Check shift right
    for i in TEST_DATA'range loop  
      wait until clk_n = '0';	
      wait for DELAY;
      assert so = TEST_DATA(i)
        report "[FAILED]: shift malfunction."
        severity failure;
    end loop;

    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;

end;
