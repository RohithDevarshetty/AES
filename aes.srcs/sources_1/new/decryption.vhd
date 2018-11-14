----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2018 18:25:03
-- Design Name: 
-- Module Name: decryption - Behavioral
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

entity decryption is
    Port ( cipher,key : in STD_LOGIC_VECTOR (127 downto 0);
           textout : out STD_LOGIC_VECTOR (127 downto 0));
end decryption;

architecture Behavioral of decryption is
component inv_lastround is
    Port ( keyin,irkey : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component roundkeys is
    Port ( key : in STD_LOGIC_VECTOR (127 downto 0);
           r1,r2,r3,r4,r5,r6,r7,r8,r9,r10 : out STD_LOGIC_VECTOR (127 downto 0));
end component;
component inv_rounds is
    Port ( keyin : in STD_LOGIC_VECTOR (127 downto 0);
           irkey : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10:std_logic_vector(127 downto 0);
signal r1,r2,r3,r4,r5,r6,r7,r8,r9,r10 : STD_LOGIC_VECTOR (127 downto 0); 
begin

u1:roundkeys port map(key,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10);
s0 <= cipher xor r10;
u2:inv_rounds port map (s0,r9,s1);
u3:inv_rounds port map (s1,r8,s2);
u4:inv_rounds port map (s2,r7,s3);
u5:inv_rounds port map (s3,r6,s4);
u6:inv_rounds port map (s4,r5,s5);
u7:inv_rounds port map (s5,r4,s6);
u8:inv_rounds port map (s6,r3,s7);
u9:inv_rounds port map (s7,r2,s8);
u10:inv_rounds port map (s8,r1,s9);
u11:inv_lastround port map(s9,key,s10);

textout<=s10;

end Behavioral;

