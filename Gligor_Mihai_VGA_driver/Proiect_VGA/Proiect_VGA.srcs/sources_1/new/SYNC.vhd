library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.ALL;


entity SYNC is
Port 
(
signal clk : in std_logic;
signal hsync,vsync : out std_logic;
signal r,g,b : out std_logic_vector(3 downto 0)
 );
end SYNC;

architecture Behavioral of SYNC is

signal HPOS: integer range 0 to 1688:=0;
signal VPOS: integer range 0 to 1066:=0;

--signal Xpos:integer range 0 to 1688:=0; 
--signal Ypos:integer range 0 to 1066:=0;

begin


process(clk)
begin
if clk'event and clk='1' then
-------desenam o linie orizontala in mijlocul ecranului (mijloc h => offset plus suze/2 adica 160 + 640/2 = 480)
-------desenam o linie verticala pe mijlocul ecranului (mijloc v=> offset plus suze/2 adica 41 + 480/2 = 281)or  hpos=240 or  vpos=140 or vpos=420

 if hpos=1048 or vpos=554 or hpos=524 or vpos=277  then
        r<=(others=>'1');
        g<=(others=>'1');
        b<=(others=>'1');
    else
        r<=(others=>'0');
        g<=(others=>'0');
        b<=(others=>'0');
end if;




    --------------------------------------------
    if hpos<1688 then
        HPOS<=HPOS+1;
    else
        HPOS<=0;
        if vpos<1066 then
            vpos<=vpos+1;      ---scanarea ecranului linie cu linie
        else
            vpos<=0;
        end if;
    end if;
   ------------------------------------------------ 
    if hpos>48 and hpos<160 then ---horizontal sync are low intre front porch si back porch
        hsync<='0';
    else
        hsync<='1';
    end if;
    if vpos>0 and vpos<4 then --vertical sync are low intre front porch si back porch
        vsync<='0';
    else
        vsync<='1';
    end if;
    -------------------------------------------------
    if ( hpos>0 and hpos<408 ) or ( vpos>0 and vpos<48 ) then --intre inceputul de la fp si sfarsitul de la bp rgb primeste low
        R<=(others=>'0');
        G<=(others=>'0');
        B<=(others=>'0');
    end if;
    --------------------------------------------------
    
end if;
end process;




end Behavioral;
