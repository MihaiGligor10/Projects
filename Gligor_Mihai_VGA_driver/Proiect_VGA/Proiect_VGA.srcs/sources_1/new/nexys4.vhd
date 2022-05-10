library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity nexys4 is
Port 
(
signal clk:in std_logic;
signal VGA_R:out std_logic_vector(3 downto 0);
signal VGA_G:out std_logic_vector(3 downto 0);
signal VGA_B:out std_logic_vector(3 downto 0);
signal VGA_HS:out std_logic;
signal VGA_VS:out std_logic
);
end nexys4;

architecture Behavioral of nexys4 is

component VGA is
Port 
( 
signal clk:in std_logic; 
signal VGA_HS:out std_logic;
signal VGA_VS:out std_logic;
signal VGA_R:out std_logic_vector(3 downto 0);
signal VGA_G:out std_logic_vector(3 downto 0);
signal VGA_B:out std_logic_vector(3 downto 0)
);
end component VGA;

begin

vgaPM: VGA port map(clk=>clk,VGA_HS=>VGA_HS,VGA_VS=>VGA_VS,VGA_R=>VGA_R,VGA_G=>VGA_G,VGA_B=>VGA_B);



end Behavioral;
