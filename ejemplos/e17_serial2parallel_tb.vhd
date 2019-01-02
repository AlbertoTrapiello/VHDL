library IEEE;
use IEEE.std_logic_1164.all;

entity e17_sipo_sr_tb is
end e17_sipo_sr_tb;

architecture behavior of e17_sipo_sr_tb is 

  constant TEST_DATA: std_logic_vector(7 downto 0) := X"A5";

  -- Component Declaration for the Unit Under Test (UUT)
  component e17_sipo_sr
    generic (
      WIDTH: positive
    );
    port (
      CLR_N  : in  std_logic;
      CLK    : in  std_logic;
      CE_N   : in  std_logic;
      START_N: in  std_logic;
      SI     : in  std_logic;
      PO     : out std_logic_vector(WIDTH - 1 downto 0);
      DONE_N : out std_logic
    );
  end component;

  --Inputs
  signal clr_n  : std_logic;
  signal clk    : std_logic;
  signal ce_n   : std_logic;
  signal start_n: std_logic;
  signal si     : std_logic;

  --Outputs
  signal po     : std_logic_vector(TEST_DATA'range);
  signal done_n : std_logic;

  -- Clock period definitions
  constant CLK_PERIOD: time := 10 ns;
  constant DELAY: time := 0.1 * CLK_PERIOD;
 
begin

	-- Instantiate the Unit Under Test (UUT)
  uut: e17_sipo_sr
    generic map (
      WIDTH => TEST_DATA'length
    )
    port map (
      CLR_N   => clr_n,
      CLK     => clk,
      CE_N    => ce_n,
      START_N => start_n,
      SI      => si,
      PO      => po,
      DONE_N  => done_n
    );

  -- Clock process
  clk_process: process
  begin
    clk <= '0';
    wait for 0.5 * CLK_PERIOD;
    clk <= '1';
    wait for 0.5 * CLK_PERIOD;
  end process;

  --Data line process
  dataline: process
  begin
    wait until start_n = '0';
    wait until start_n = '1';
    for i in TEST_DATA'range loop
      si <= TEST_DATA(i);
      wait until clk = '0';
    end loop;
    si <= '0';
    wait;
  end process;

  -- Stimulus process
  clr_n   <= '0' after 0.25 * CLK_PERIOD, '1' after 1.25 * CLK_PERIOD;
  ce_n    <= '0' after 0.25 * CLK_PERIOD;
  start_n <= '1' after 0.25 * CLK_PERIOD, '0' after 2.25 * CLK_PERIOD,
             '1' after 3.25 * CLK_PERIOD;
  stim_proc: process
  begin
    -- Check reset
    wait until clr_n = '0';
    wait for DELAY;
    assert done_n = '0' and po = X"00"
      report "[FAILED]: CLR_N malfunction."
      severity failure;

    -- Check data load
    wait until start_n = '0';
    wait until clk = '1';
    wait for DELAY;
    assert done_n = '1'
      report "[FAILED]: START_N malfunction."
      severity failure;

    -- Check serial to parallel conversion
    wait until done_n = '0' for 12 * clk_period;
    wait for DELAY;
    assert po = TEST_DATA
      report "[FAILED]: shiftregister malfunction."
      severity failure;

    wait until clk = '1';

    assert false
      report "[PASSED]: Simulation finished."
      severity failure;
  end process;

end;
