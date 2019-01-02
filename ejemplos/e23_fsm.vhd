----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:31:29 11/10/2015 
-- Design Name: 
-- Module Name:    fsm - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity e23_fsm is
  port (
    RESET     : in  std_logic;
    CLK       : in  std_logic;
    PUSHBUTTON: in  std_logic;
    LIGHT     : out std_logic
  );
end e23_fsm;

architecture behavioral of e23_fsm is
  type STATES is (S0, S1, S2, S3);
  signal current_state: STATES;
  signal next_state: STATES;
begin
  state_register: process (RESET, CLK)
  begin
    if RESET = '1' then
      current_state <= S0;
    elsif CLK'event and CLK = '1' then
      current_state <= next_state;     
    end if;
  end process;
  
  nextstate_decod: process (PUSHBUTTON, current_state)
  begin
    next_state <= current_state;
    case current_state is
      when S0 =>
        if PUSHBUTTON = '1' then      
          next_state <= S1;
        end if;
      when S1 =>
        if PUSHBUTTON = '0' then      
          next_state <= S2;
        end if;
      when S2 => 
        if PUSHBUTTON = '1' then      
          next_state <= S3;
        end if;
      when S3 => 
        if PUSHBUTTON = '0' then      
          next_state <= S0;
        end if;
      when others =>
        next_state <= S0;
    end case;
  end process;

  output_decod: process (current_state)
  begin
    case current_state is
      when S0 =>
        LIGHT <= '0';
      when S1 =>
        LIGHT <= '1';
      when S2 => 
        LIGHT <= '1';
      when S3 => 
        LIGHT <= '0';
      when others => 
        LIGHT <= '0';
    end case;
  end process;
end behavioral;

