----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2018 21:29:23
-- Design Name: 
-- Module Name: encryption - Behavioral
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

entity encryption is
    Port ( textin,key : in STD_LOGIC_VECTOR (127 downto 0);
           cipher : out STD_LOGIC_VECTOR (127 downto 0));
end encryption;

architecture Behavioral of encryption is
component lastround is
    Port ( keyin,rkey : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component roundkeys is
    Port ( key : in STD_LOGIC_VECTOR (127 downto 0);
           r1,r2,r3,r4,r5,r6,r7,r8,r9,r10 : out STD_LOGIC_VECTOR (127 downto 0));
end component;
component rounds is
    Port ( keyin : in STD_LOGIC_VECTOR (127 downto 0);
           rkey : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10:std_logic_vector(127 downto 0);
signal r1,r2,r3,r4,r5,r6,r7,r8,r9,r10 : STD_LOGIC_VECTOR (127 downto 0); 
begin

u1:roundkeys port map(key,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10);
s0 <= textin xor key;
u2:rounds port map (s0,r1,s1);
u3:rounds port map (s1,r2,s2);
u4:rounds port map (s2,r3,s3);
u5:rounds port map (s3,r4,s4);
u6:rounds port map (s4,r5,s5);
u7:rounds port map (s5,r6,s6);
u8:rounds port map (s6,r7,s7);
u9:rounds port map (s7,r8,s8);
u10:rounds port map (s8,r9,s9);
u11:lastround port map(s9,r10,s10);

cipher<=s10;

end Behavioral;
