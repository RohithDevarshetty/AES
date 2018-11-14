----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2018 11:24:07 AM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is 
    Port ( a,key : in STD_LOGIC_VECTOR (127 downto 0); 
           c,d : out STD_LOGIC_VECTOR (127 downto 0)); 
end datapath; 
 
architecture Behavioral of datapath is 
component encryption is 
Port ( textin,key : in STD_LOGIC_VECTOR (127 downto 0); 
           cipher : out STD_LOGIC_VECTOR (127 downto 0)); 
           end component; 
           component decryption is 
           Port ( cipher,key : in STD_LOGIC_VECTOR (127 downto 0); 
                      textout : out STD_LOGIC_VECTOR (127 downto 0)); 
                      end component; 
                      signal s0,s1:std_logic_vector(127 downto 0); 
begin 
x1:encryption port map(textin=>a,key=>key,cipher=>s0); 
x2:decryption port map(cipher=>s0,key=>key,textout=>s1); 

c<=s0;
d<=s1;
end Behavioral;
