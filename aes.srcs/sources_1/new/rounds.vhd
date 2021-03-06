----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2018 21:02:53
-- Design Name: 
-- Module Name: rounds - Behavioral
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

entity rounds is
    Port ( keyin : in STD_LOGIC_VECTOR (127 downto 0);
           rkey : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : out STD_LOGIC_VECTOR (127 downto 0));
end rounds;

architecture Behavioral of rounds is
component subbytes is
    Port ( a : in STD_LOGIC_VECTOR (127 downto 0);
           s : out STD_LOGIC_VECTOR (127 downto 0));
end component;
component shift_rows is
    Port ( a : in STD_LOGIC_VECTOR(127 DOWNTO 0);
           b : out STD_LOGIC_VECTOR(127 DOWNTO 0));
end component;
component mixcolumns is
    Port ( a : in STD_LOGIC_VECTOR (127 downto 0);
           m : out STD_LOGIC_VECTOR (127 downto 0));
end component;
component addroundkey is
 Port ( r_key : in STD_LOGIC_VECTOR (127 downto 0);
        s : in STD_LOGIC_VECTOR (127 downto 0);
        s_out : out STD_LOGIC_VECTOR (127 downto 0));
end component;
signal subout,shiftout,mixcout:std_logic_vector(127 downto 0);
begin
u1:subbytes port map(keyin,subout);
u2:shift_rows port map(subout,shiftout);
u3:mixcolumns port map(shiftout,mixcout);
u4:addroundkey port map(rkey,mixcout,keyout);

end Behavioral;
