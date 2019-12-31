library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RGB IS 
   port(texton , graphon ,paron ,par2on : in std_logic := '0' ;
		  R: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  G: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  B: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
		  
end RGB;


architecture behaviour of RGB is 
begin
----------------------------------------------------------------------------
process(texton,graphon,paron,par2on)
begin

--  if( (texton = '1')  or (graphon = '1') ) then
  if( texton = '1') then
     R <= "1100" ;
     G <= "1111" ;
     B <= "0011" ;	  
  elsif(graphon = '1') then
	  R <= "1111" ;
     G <= "1111" ;
     B <= "1111" ;
  elsif(paron = '1') then
	  R <= "0011" ;
     G <= "1111" ;
     B <= "1100" ;
  elsif(par2on = '1') then
	  R <= "0011" ;
     G <= "1111" ;
     B <= "1100" ;
  elsif( (texton = '0') or (graphon = '0') or (paron = '0') or (par2on = '0')) then
	  R <= "0000" ;
	  G <= "0000" ;
	  B <= "0000" ;
  end if ;

end process;


end behaviour;  