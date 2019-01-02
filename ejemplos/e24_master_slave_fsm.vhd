library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity e24_master_fsm is
  port (
    RESET     : in  std_logic;
    CLK       : in  std_logic;
    PUSHBUTTON: in  std_logic;
    DONE      : in  std_logic;
    DATA      : out unsigned(15 downto 0);
    START     : out std_logic;
    LIGHT     : out std_logic
  );
end e24_master_fsm;

architecture behavioral of e24_master_fsm is
  type STATES is (S0_OFF, S1_STARTTEMP, S2_WAIT, S3_STARTTEMP, S4_WAIT);
  signal current_state: STATES;
  signal next_state   : STATES;
begin
  state_register: process (RESET, CLK)
  begin
    if RESET = '1' then
      current_state <= S0_OFF;
    elsif CLK'event and CLK = '1' then
      current_state <= next_state;     
    end if;
  end process;
  
  nextstate_decod: process (PUSHBUTTON, DONE, current_state)
  begin
    next_state <= current_state;
    case current_state is
      when S0_OFF =>
        if PUSHBUTTON = '1' then      
          next_state <= S1_STARTTEMP;
        end if;
      when S1_STARTTEMP =>
        if PUSHBUTTON = '1' then      
          next_state <= S0_OFF;
        else
          next_state <= S2_WAIT;
        end if;
      when S2_WAIT => 
        if PUSHBUTTON = '1' then      
          next_state <= S0_OFF;
        elsif DONE = '1' then
          next_state <= S3_STARTTEMP;
        end if;
      when S3_STARTTEMP => 
        if PUSHBUTTON = '1' then      
          next_state <= S0_OFF;
        else
          next_state <= S4_WAIT;
        end if;
      when S4_WAIT => 
        if PUSHBUTTON = '1' then      
          next_state <= S0_OFF;
        elsif DONE = '1' then
          next_state <= S1_STARTTEMP;
        end if;
      when others =>
        next_state <= S0_OFF;
    end case;
  end process;

  output_decod: process (current_state)
  begin
    case current_state is
      when S0_OFF =>
        DATA  <= to_unsigned(1, data'length);
        START <= '0';
        LIGHT <= '0';
      when S1_STARTTEMP =>
        DATA  <= to_unsigned(1, data'length);
        START <= '1';
        LIGHT <= '0';
      when S2_WAIT => 
        DATA  <= to_unsigned(1, data'length);
        START <= '0';
        LIGHT <= '1';
      when S3_STARTTEMP => 
        DATA  <= to_unsigned(9, data'length);
        START <= '1';
        LIGHT <= '0';
      when S4_WAIT => 
        DATA  <= to_unsigned(9, data'length);
        START <= '0';
        LIGHT <= '0';
      when others => 
        DATA  <= to_unsigned(1, data'length);
        START <= '0';
        LIGHT <= '0';
    end case;
  end process;
end behavioral;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity e24_slave_fsm is
  port ( 
    reset: in  std_logic;
    clk  : in  std_logic;
    data : in  unsigned(15 downto 0);
    start: in  std_logic;
    done : out std_logic
  );
end e24_slave_fsm;

architecture behavioral of e24_slave_fsm is
  subtype data_t is integer range 0 to 2**data'length - 1;
  signal current_state: data_t;
  signal next_state   : data_t;
begin
  state_register: process (reset, clk)
  begin
    if reset = '1' then
      current_state <= 0;
    elsif clk'event and clk = '1' then
      current_state <= next_state;     
    end if;
  end process;
  
  nextstate_decod: process (start, current_state)
  begin
    next_state <= current_state;
    case current_state is
      when 0 =>
        if start = '1' then
          next_state <= to_integer(data);
        end if;
      when others => 
        if start = '1' then
          next_state <= to_integer(data);
        else
          next_state <= current_state - 1;
        end if;
    end case;
  end process;

  output_decod: process (current_state)
  begin
    case current_state is
      when 0 =>
        done <= '1';
      when others => 
        done <= '0';
    end case;
  end process;
end behavioral;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity e24_control_unit is
  port (
    reset     : in  std_logic;
    clk       : in  std_logic;
    pushbutton: in  std_logic;
    light     : out std_logic
  );
end e24_control_unit;

architecture structural of e24_control_unit is

  component e24_master_fsm is
    port (
      reset     : in  std_logic;
      clk       : in  std_logic;
      pushbutton: in  std_logic;
      done      : in  std_logic;
      data      : out unsigned(15 downto 0);
      start     : out std_logic;
      light     : out std_logic
    );
  end component;

  component e24_slave_fsm is
    port ( 
      reset: in  std_logic;
      clk  : in  std_logic;
      data : in  unsigned(15 downto 0);
      start: in  std_logic;
      done : out std_logic
    );
  end component;

  signal start: std_logic;
  signal done : std_logic;
  signal data : unsigned(15 downto 0);

begin
  master: e24_master_fsm
    port map (
      reset      => reset,
      clk        => clk,
      pushbutton => pushbutton,
      done       => done,
      data       => data,
      start      => start,
      light      => light
    );

  slave: e24_slave_fsm
    port map ( 
      reset      => reset,
      clk        => clk,
      data       => data,
      start      => start,
      done       => done
    );
end structural;
