library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity graph IS 
	port(	--- yes, no : in STD_LOGIC ;
        CLK: in std_logic;   
		  RST : in std_logic ;
-----------------------------------------------------------------------------------------		  
 hpos : in integer := 100;
 vpos : in integer := 0;
 videoon  : in std_logic := '0' ;
 graphon  : out std_logic := '0' 

 );
		  
end graph;


architecture behaviour of graph is 
----------------------------------------------------------------------------
 
constant vertical: integer := 300;
constant horizontal: integer := 300;
constant thickness : integer := 2;
constant hstart: integer := 80;
constant vstart : integer := 40;

signal xpos, xpos2 : INTEGER := 500;
signal ypos, ypos2 : INTEGER := 200;
signal xcur, ycur  : INTEGER;
signal size : INTEGER := 50;
signal option : integer := 0 ;

constant hmiddle : integer :=  (horizontal/3) + 10 ;
constant vmiddle : integer :=   (vertical/3) + 20 ;


begin 

	
boundary: process(CLK,RST,videoon,hpos,vpos)
begin

	if(RST = '1')then
	   graphon <= '0';
	elsif(CLK'event and CLK = '1') then
	
				if(videoon = '1' ) then	
				
						 if(((hpos >= hstart and hpos <= (hstart + thickness) ) and (vpos >= vstart and vpos <= vertical)) oR ((hpos >= hstart and hpos <=  horizontal ) and (vpos >= vstart and vpos <= (vstart + thickness))) OR 
						 ((hpos >= horizontal  and hpos <= ( horizontal + thickness )) and (vpos >= vstart and vpos <=  vertical)) OR ((hpos >= hstart and hpos <= horizontal) and (vpos >= vertical  and vpos <= (vertical + thickness))) 
						 )then	 
							 graphon <= '1';
						 else 
							 graphon <= '0';
						 end if;			
					
--				elsif (videoon = '1' and option = 2) then 
--				
--							
--							
--							if(((hpos >= hstart and hpos <= (hstart + thickness) ) and (vpos >= vstart and vpos <= vertical)) oR ((hpos >= hstart and hpos <=  horizontal ) and (vpos >= vstart and vpos <= (vstart + thickness))) OR 
--						 ((hpos >= horizontal  and hpos <= ( horizontal + thickness )) and (vpos >= vstart and vpos <=  vertical)) OR ((hpos >= hstart and hpos <= horizontal) and (vpos >= vertical  and vpos <= (vertical + thickness))) or
--						 ((hpos >= hmiddle  and hpos <= ( hmiddle + thickness )) and (vpos >= vstart and vpos <=  vmiddle)) OR ((hpos >= hstart and hpos <= hmiddle) and (vpos >= vmiddle  and vpos <= (vmiddle + thickness)))
--						 )then	   
--									 graphon <= '1';
--									 else 
--									 graphon <= '0';
--						  end if;			
	 else
			graphon <= '0';
	 end if;
	  end if ;
end process ;
--
--process(yes , no) 
--	begin 
--		
--		if yes = '0' then 
--		
--		option <= option + 1 ;
--		
--		elsif yes = '1' or no = '1' or no = '0' then
--		
--		option <= option ;
--		
--		end if ;
--		
--end process;

	
end behaviour;  