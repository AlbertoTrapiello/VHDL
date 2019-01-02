library IEEE;
use IEEE.std_logic_1164.all;

package e04_mux_pkg is
  subtype mux_bus is std_logic_vector(7 downto 0);
  type mux_bus_vector is array (natural range <>) of mux_bus;
end;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

use work.e04_mux_pkg.all;

-- Bus multiplexer
entity e04_mux is
  generic (
    FANIN: positive := 4
  );
  port (
    A: in  mux_bus_vector(0 to FANIN - 1);  -- Inputs
    S: in  std_logic_vector(integer(ceil(log2(real(FANIN)))) - 1 downto 0);  -- Input selection
    Y: out mux_bus                          -- Mux output
  );
end e04_mux;

architecture dataflow of e04_mux is
begin
  Y <= A(to_integer(unsigned(S)));
end dataflow;
