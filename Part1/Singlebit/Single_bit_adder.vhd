----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 03:20:48 PM
-- Design Name: 
-- Module Name: Single_bit_adder - Behavioral
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


entity Single_bit_adder is
--  Port ( );
Port(
    A: in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    S : out std_logic;
    Cout : out std_logic
);
end Single_bit_adder;

architecture Behavioral of Single_bit_adder is

begin
    S <= Cin xor (A xor B);
    Cout <=  ((A xor B) and Cin) or (A and B);

end Behavioral;
