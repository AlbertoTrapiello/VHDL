library IEEE;
use IEEE.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity e22_sync_div is
  port (
    RESET   : in  std_logic;
    CLK500HZ: in  std_logic;
    CLK1HZ  : out std_logic;
    CLK5HZ  : out std_logic
  );
end e22_sync_div;

architecture structural of e22_sync_div is

  component e21_fdivider
    generic (
      MODULE: positive
    );
    port(
      RESET : in  std_logic;
      CLK   : in  std_logic;
      CE_IN : in  std_logic;
      CE_OUT: out std_logic
    );
  end component;

  constant prescaler_module: positive :=  500 / 10; -- 500Hz -> 10Hz
  constant timer1_module   : positive :=   10 /  5; --  10Hz ->  5Hz
  constant timer2_module   : positive :=   10 /  1; --  10Hz ->  1Hz

  signal clk10Hz_i: std_logic;

begin

  prescaler: e21_fdivider
    generic map (
      MODULE => prescaler_module
    )
    port map (
      RESET  => RESET,
      CLK    => CLK500HZ,
      CE_IN  => '1',
      CE_OUT => clk10Hz_i
    );

  timer1: e21_fdivider
    generic map (
      MODULE => timer1_module
    )
    port map (
      RESET  => RESET,
      CLK    => CLK500HZ,
      CE_IN  => clk10Hz_i,
      CE_OUT => CLK5HZ
    );

  timer2: e21_fdivider
    generic map (
      MODULE => timer2_module
    )
    port map (
      RESET  => RESET,
      CLK    => CLK500HZ,
      CE_IN  => clk10Hz_i,
      CE_OUT => CLK1HZ
    );

end structural;
