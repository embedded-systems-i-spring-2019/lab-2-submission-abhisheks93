----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 05:27:21 PM
-- Design Name: 
-- Module Name: Ripple_adder_tb - Behavioral
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


entity Ripple_adder_tb is
--  Port ( );
end Ripple_adder_tb;

architecture Behavioral of Ripple_adder_tb is

signal A_tb : std_logic_vector(3 downto 0);
signal B_tb : std_logic_vector(3 downto 0);
signal S_tb : std_logic_vector(3 downto 0);
signal Cin_tb : std_logic;
signal Cout_tb : std_logic;


 
component Ripple_adder is
Port(A : in std_logic_vector(3 downto 0);
     B : in std_logic_vector(3 downto 0);
     S : out std_logic_vector(3 downto 0);
     Cin : in std_logic;
     Cout : out std_logic);
end component;
begin

    A_tb <= "0010";
    B_tb <= "0011";
    Cin_tb <= '1';

adder_4_bit : Ripple_adder
port map(
      A=> A_tb,
      B=> B_tb,
      S=> S_tb,
      Cin=> Cin_tb,
      Cout=> Cout_tb);

end Behavioral;
