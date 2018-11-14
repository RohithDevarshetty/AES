----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2018 23:41:22
-- Design Name: 
-- Module Name: sbox_tb - Behavioral
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
entity sbox_tb is

end sbox_tb;

architecture Behavioral of sbox_tb is
signal s,q: std_logic_vector(7 downto 0);
component sbox is
    Port ( s : in STD_LOGIC_VECTOR (7 downto 0);
           q : out STD_LOGIC_VECTOR (7 downto 0));
end component;
begin
uut : sbox port map(s=>s,q=>q);
    process 
    begin
        s<="00000100";
       
        wait;
    end process;
end Behavioral;
