----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2018 18:11:15
-- Design Name: 
-- Module Name: inv_rounds - Behavioral
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

entity inv_rounds is
    Port ( keyin : in STD_LOGIC_VECTOR (127 downto 0);
           irkey : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : out STD_LOGIC_VECTOR (127 downto 0));
end inv_rounds;

architecture Behavioral of inv_rounds is
component inv_subbytes is
    Port ( a : in STD_LOGIC_VECTOR (127 downto 0);
           s : out STD_LOGIC_VECTOR (127 downto 0));
end component;
component inv_shiftrows is
    Port ( a : in STD_LOGIC_VECTOR(127 DOWNTO 0);
           b : out STD_LOGIC_VECTOR(127 DOWNTO 0));
end component;
component inv_mixcolumns is
    Port ( a : in STD_LOGIC_VECTOR (127 downto 0);
           m : out STD_LOGIC_VECTOR (127 downto 0));
end component;
component addroundkey is
 Port ( r_key : in STD_LOGIC_VECTOR (127 downto 0);
        s : in STD_LOGIC_VECTOR (127 downto 0);
        s_out : out STD_LOGIC_VECTOR (127 downto 0));
end component;
signal ishout,isubout,arkout:std_logic_vector(127 downto 0);
begin
u1:inv_shiftrows port map(keyin,ishout);
u2:inv_subbytes port map(ishout,isubout);
u3:addroundkey port map(irkey,isubout,arkout);
u4:inv_mixcolumns port map(arkout,keyout);

end Behavioral;
