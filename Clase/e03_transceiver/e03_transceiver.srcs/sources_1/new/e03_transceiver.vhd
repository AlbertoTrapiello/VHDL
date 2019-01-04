----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2019 11:49:53
-- Design Name: 
-- Module Name: e03_transceiver - 
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
use IEEE.std_logic_1164.all;

-- Bidirectional transceiver
entity e03_transceiver is
  generic (
    WIDTH: positive := 8
  );
  port (
    DIR: in    std_logic;
    A  : inout std_logic_vector(WIDTH - 1 downto 0);
    B  : inout std_logic_vector(WIDTH - 1 downto 0)
  );
end e03_transceiver;

architecture dataflow of e03_transceiver is
begin
  B <= A when DIR = '0' else
       (others => 'Z');
  A <= B when DIR = '1' else
       (others => 'Z');
end dataflow;