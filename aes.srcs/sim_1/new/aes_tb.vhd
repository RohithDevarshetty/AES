----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2018 00:05:12
-- Design Name: 
-- Module Name: aes_tb - Behavioral
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

entity aes_tb is
   
end aes_tb;

architecture Behavioral of aes_tb is
component aes is 
    Port ( a,key : in STD_LOGIC_VECTOR (127 downto 0); 
           c,d : out STD_LOGIC_VECTOR (127 downto 0)); 
end component;
signal sa,skey,sc,sd: std_logic_vector (127 downto 0);

begin
uut: aes port map(a=>sa,key=>skey,c=>sc,d=>sd);
    
    process
    begin
    sa<=x"000000000000000000000000000000aa";
    skey<=x"00000000000000000000000000000055";
    wait;
    end process;
    
end Behavioral;
