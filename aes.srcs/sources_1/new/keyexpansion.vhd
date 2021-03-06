----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2018 19:54:05
-- Design Name: 
-- Module Name: keyexpansion - Behavioral
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

entity keyexpansion is
        Port ( a : in std_logic_vector(127 downto 0);
               rcon : in std_logic_vector(7 downto 0);
               k : out std_logic_vector(127 downto 0));
end keyexpansion;

architecture Behavioral of keyexpansion is

component sbox is
    port(s:in std_logic_vector(7 downto 0);
         q:out std_logic_vector(7 downto 0));
end component;        

signal w0,w1,w2,w3,t,p,r0,x0,x1,x2,x3:std_logic_vector(31 downto 0);

begin
w0<=a(127 downto 96);
w1<=a(95 downto 64);
w2<=a(63 downto 32);
w3<=a(31 downto 0);

t<=a(23 downto 16)&a(15 downto 8)&a(7 downto 0)&a(31 downto 24);
u1:sbox port map(t(31 downto 24),p(31 downto 24));
u2:sbox port map(t(23 downto 16),p(23 downto 16));
u3:sbox port map(t(15 downto 8),p(15 downto 8));
u4:sbox port map(t(7 downto 0),p(7 downto 0));

r0<=(p(31 downto 24) xor rcon)&p(23 downto 16)&p(15 downto 8)&p(7 downto 0);

x0<=r0 xor w0;
x1<=x0 xor w1;
x2<=x1 xor w2;
x3<=x2 xor w3;

k<=x0&x1&x2&x3;

end behavioral;