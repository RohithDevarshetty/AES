----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2018 16:55:14
-- Design Name: 
-- Module Name: mixcolumn_c - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mixcolumn_c is
    Port ( s1,s2,s3,s4 : in STD_LOGIC_VECTOR (7 downto 0);
           d : out STD_LOGIC_VECTOR (7 downto 0));
end mixcolumn_c;

architecture Behavioral of mixcolumn_c is

begin
d(7)<=s1(6) xor s2(6) xor s2(7) xor s3(7) xor s4(7);

d(6)<=s1(5) xor s2(5) xor s2(6) xor s3(6) xor s4(6);

d(5)<=s1(4) xor s2(4) xor s2(5) xor s3(5) xor s4(5);

d(4)<=s1(3) xor s1(7) xor s2(3) xor s2(4) xor s2(7) xor s3(4) xor s4(4);

d(3)<=s1(2) xor s1(7) xor s2(2) xor s2(3) xor s2(7) xor s3(3) xor s4(3);

d(2)<=s1(1) xor s2(1) xor s2(2) xor s3(2) xor s4(2);

d(1)<=s1(0) xor s1(7) xor s2(0) xor s2(1) xor s2(7) xor s3(1) xor s4(1);

d(0)<=s1(7) xor s2(7) xor s2(0) xor s3(0) xor s4(0);

end Behavioral;
