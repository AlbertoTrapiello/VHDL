library IEEE;
use IEEE.std_logic_1164.all;

-- Serial In Parallel Output Shift Register
entity e17_sipo_sr is
  generic (
    WIDTH: positive := 4
  );
  port (
    CLR_N  : in  std_logic;
    CLK    : in  std_logic;
    CE_N   : in  std_logic;
    START_N: in  std_logic;
    SI     : in  std_logic;
    PO     : out std_logic_vector (WIDTH - 1 downto 0);
    DONE_N : out std_logic
  );
end e17_sipo_sr;

architecture behavioral of e17_sipo_sr is
  signal reg: std_logic_vector(PO'range);
begin
  process (CLR_N, CLK)
    variable remaining: integer range 0 to WIDTH;
  begin
    if CLR_N = '0' then
      reg <= (others => '0');
      remaining := 0;
    elsif rising_edge(CLK) then
      if CE_N = '0' then
        if START_N = '0' then
          remaining := WIDTH;
        elsif remaining /= 0 then
          reg <= SI & reg(reg'high downto 1);
          remaining := remaining - 1;
        end if;
      end if;        
    end if;
    if remaining = 0 then
      DONE_N <= '0'; 
    else
      DONE_N <= '1';
    end if;      
  end process;
  PO <= reg;
end;
