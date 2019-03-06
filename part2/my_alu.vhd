
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity my_alu is
--  Port ( );
Port(
    opcode : in std_logic_vector(3 downto 0);
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    C : out std_logic_vector(3 downto 0));
end my_alu;

architecture Behavioral of my_alu is

begin
    process 
        begin
        case opcode is
           when "0000" => C <= std_logic_vector(unsigned(A) + unsigned(B));
           when "0001" => C <= std_logic_vector(unsigned(A) - unsigned(B));
           when "0010" => C <=std_logic_vector(unsigned(A) + 1);
           when "0011"  => C <=std_logic_vector(unsigned(A) - 1);
           when "0100" => C <=std_logic_vector(0 - unsigned(A)) ;
           when "0101" => 
		              if A>B then
			             C <= "0001";
			          else 
			             C <= "0000";
			          end if;
           when "0110" => C <= A(2 downto 0) & '0';
           when "0111"=> C<=  '0' & A(3 downto 1);
           when "1000"=> C<=   A(3) & A(3 downto 1);
           when "1001"=> C<=   not A;
           when "1010"=> C<=   A and B;
           when "1011"=> C<=   A or B;
           when "1100"=> C<=   A xor B;
           when "1101"=> C<=   A xnor B;
           when "1110"=> C<=   A nand B;
           when "1111"=> C<=   A nor B;
           when others => C <= "0000";
         end case;
     end process;       
end Behavioral;
