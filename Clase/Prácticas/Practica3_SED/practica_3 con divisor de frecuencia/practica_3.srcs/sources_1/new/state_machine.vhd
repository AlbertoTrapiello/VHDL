----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2018 13:56:26
-- Design Name: 
-- Module Name: parity_machine - parity_machine
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;
-----------------------------------------------------------------------------------
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parity_machine is
    Port (reset, x, clk: IN BIT;
          parity: OUT BIT);
end parity_machine;

entity fdivider is
GENERIC(MODULE:positive:=16);
    Port(reset,clk: IN BIT;
    CE_OUT: OUT BIT);
end fdivider;
-----------------------------------------------------------------------------------
architecture behavioral of fdivider is
begin
process (RESET, CLK)
subtype count_range is integer range 0 to
module - 1;
variable count: count_range;
begin
if RESET = '1' then
count := count_range'high;
CE_OUT <= '0';
elsif clk'event AND clk='1' then
CE_OUT <= '0';
if count /= 0 then
count := count - 1;
else
CE_OUT <= '1';
count := count_range'high;
end if;
end if;
end process;
end behavioral;

architecture parity_machine of parity_machine is

    TYPE state_type IS (S0, S1);
    SIGNAL state, next_state: state_type;
    SIGNAL clk_mod: BIT;
    
    COMPONENT fdivider is
    Port(reset,clk: IN BIT;
        CE_OUT: OUT BIT);
    end component;
    
 begin
    divisor1:fdivider PORT MAP(reset=>reset, clk=>clk, CE_OUT=>clk_mod);
    
    SYNC_PROC: PROCESS (clk_mod)
    BEGIN
        IF clk_mod'event and clk_mod='1' THEN
            IF (reset='1') THEN
                state <= S0;
            ELSE
                state <= next_state;
            END IF;
        END IF;
    END PROCESS;

    OUTPUT_DECODE: PROCESS(state)
    BEGIN
        CASE (state) IS
            WHEN S0 => parity <= '0';
            WHEN S1 => parity <= '1';
            WHEN OTHERS => parity <= '0';
        END CASE;
    END PROCESS;
    
    NEXT_STATE_DECODE: PROCESS (state, x)
    BEGIN
        next_state <= S0;
        CASE (state) IS
            WHEN S0 =>
                IF (x='1') THEN
                    next_state <= S1;
                END IF;
            WHEN S1 =>
                IF (x = '0') THEN
                    next_state <= S1;
                END IF;
            WHEN OTHERS => next_state <= S0;
        END CASE;
    END PROCESS;

end parity_machine;


--------------------------------------------------------------------------------------
