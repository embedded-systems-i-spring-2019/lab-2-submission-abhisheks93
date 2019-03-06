----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 03:36:34 PM
-- Design Name: 
-- Module Name: Ripple_adder - Behavioral
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

entity Ripple_adder is
--  Port ( );
Port(A : in std_logic_vector(3 downto 0);
     B : in std_logic_vector(3 downto 0);
     S : out std_logic_vector(3 downto 0);
     Cin : in std_logic;
     Cout : out std_logic);

end Ripple_adder;

architecture Behavioral of Ripple_adder is

signal cout0 : std_logic;
signal cout1 : std_logic;
signal cout2 : std_logic;

component Single_bit_adder is
Port(
    A: in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    S : out std_logic;
    Cout : out std_logic
);

end component;

begin

bit0 : Single_bit_adder
port map(
    A => A(0),
    B => B(0),
    Cin => Cin,
    Cout => Cout0,
    S=> S(0)
    ); 


bit1 : Single_bit_adder
port map(
    A => A(1),
    B => B(1),
    Cin => Cout0,
    Cout => Cout1,
    S=> S(1)
    ); 



bit2 : Single_bit_adder
port map(
    A => A(2),
    B => B(2),
    Cin => Cout1,
    Cout => Cout2,
    S=> S(2)
    ); 


bit3 : Single_bit_adder
port map(
    A => A(3),
    B => B(3),
    Cin => Cout2,
    Cout => Cout,
    S=> S(3)
    ); 

end Behavioral;
