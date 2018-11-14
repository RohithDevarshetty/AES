----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2018 15:53:57
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
    
end tb;

architecture Behavioral of tb is
component mixcolumns is
    Port ( a : in STD_LOGIC_VECTOR(127 DOWNTO 0);
       m: out STD_LOGIC_VECTOR(127 DOWNTO 0));
end component;
signal a,m:std_logic_vector(127 downto 0);
begin
uut:mixcolumns port map(a=>a,m=>m);
process
begin
a<=X"67849302af947318afd9503913758356";wait for 10 ns;
end process;
end Behavioral;
