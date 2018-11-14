----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2018 11:22:47 AM
-- Design Name: 
-- Module Name: aes - Behavioral
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
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity aes is 
    Port ( a,key : in STD_LOGIC_VECTOR (127 downto 0); 
           c,d : out STD_LOGIC_VECTOR (127 downto 0)); 
end aes; 
 
architecture Behavioral of aes is 
 component datapath is 
 Port ( a,key : in STD_LOGIC_VECTOR (127 downto 0); 
            c,d : out STD_LOGIC_VECTOR (127 downto 0)); 
            end component; 
    signal s0,s1:std_logic; 
  begin 
  x2:datapath port map(a=>a,key=>key,c=>c,d=>d); 
 
 
end Behavioral; 
