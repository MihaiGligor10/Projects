library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity VGA is
Port 
( 
signal clk:in std_logic; --24 mhz
signal VGA_HS:out std_logic;
signal VGA_VS:out std_logic;
signal VGA_R:out std_logic_vector(3 downto 0);
signal VGA_G:out std_logic_vector(3 downto 0);
signal VGA_B:out std_logic_vector(3 downto 0)
);
end VGA;

architecture Behavioral of VGA is

component SYNC is
Port 
(
signal clk: in std_logic;
signal hsync:out std_logic;
signal vsync:out std_logic;
signal r:out std_logic_vector(3 downto 0);
signal g:out std_logic_vector(3 downto 0);
signal b:out std_logic_vector(3 downto 0)

 );
end component;

begin

c1: SYNC port map(clk=>clk,hsync=>vga_hs,vsync=>vga_vs,r=>vga_r,g=>vga_g,b=>vga_b); 

end Behavioral;