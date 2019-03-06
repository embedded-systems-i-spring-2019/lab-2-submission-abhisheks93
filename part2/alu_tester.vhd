----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 08:18:08 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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


entity alu_tester is
--  Port ( );
Port(
    clk : in std_logic;
    sw : in std_logic_vector(3 downto 0);
    btn : in std_logic_vector(3 downto 0);
    led : out std_logic_vector(3 downto 0)
    );
end alu_tester;

architecture Behavioral of alu_tester is

signal opcode : std_logic_vector(3 downto 0):=(others => '0');
signal A : std_logic_vector(3 downto 0):=(others => '0');
signal B : std_logic_vector(3 downto 0):=(others => '0');
signal C : std_logic_vector(3 downto 0):=(others => '0');
--signal clkbtn : std_logic;

signal dbnc0 : std_logic;
signal dbnc1 : std_logic;
signal dbnc2 : std_logic;
signal dbnc3 : std_logic;

component my_alu is
Port(
    opcode : in std_logic_vector(3 downto 0);
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    C : out std_logic_vector(3 downto 0));
    end component;
    
    
component debounce is 
port(
    clk     : in  std_logic;  
    btn  : in  std_logic;  
    dbnc  : out std_logic); 
    end component;
    
begin
    process(clk)
    begin
    if rising_edge(clk) then
        if dbnc3 = '1' then
            A <= "0000";
            B <= "0000";
            C <= "0000";
            opcode <= "0000";
        end if;
        
        if dbnc2 = '1' then
            opcode <= sw;
        end if;
        
        if dbnc1 = '1' then
            A <= sw;
        end if;
        
        if dbnc0 = '1' then
            B <= sw;
        end if;
        
    end if;    
        
    end process;
    
    
alu : my_alu
port map(
        opcode => opcode,
        A => A,
        B => B,
        C => led
    );
    
    
bttn0 : debounce
port map(
        clk => clk,
        btn => btn(0),
        dbnc => dbnc0
        );
        
        
bttn1 : debounce
        port map(
                clk => clk,
                btn => btn(1),
                dbnc => dbnc1
                );


bttn2 : debounce
port map(
        clk => clk,
        btn => btn(2),
        dbnc => dbnc2
        );
        

bttn3 : debounce
        port map(
                clk => clk,
                btn => btn(3),
                dbnc => dbnc3
                );           

                                         
end Behavioral;
