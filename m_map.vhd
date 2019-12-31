library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity m_map IS 
------- generic (option : integer := 0 );
	port(
	     CLK : in std_logic;
		  RST : in std_logic ;
		  HSYNC : out std_logic ;
		  VSYNC  : OUT STD_LOGIC ;
		  reset_reset: in std_logic ;     
------- RGB : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
		  R: inOUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  G: inOUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  B: inOUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		 
		  );
	
		  
end m_map;


architecture behaviour of m_map is 

	signal videoon : std_logic; 
	signal hpos ,vpos :integer;
	signal texton , graphon , paron , par2on: STD_LOGIC;

begin 
				
	vgaa: entity work.games2
	port map(CLK=>CLK,RST=>RST,HSYNC=>HSYNC,VSYNC=>VSYNC,reset_reset=>reset_reset,
	          hpos=>hpos,vpos=>vpos ,videoon =>videoon);
			
   graphh: entity work.graph
	port map( CLK=>CLK,RST=>RST,hpos=>hpos,vpos=>vpos ,videoon =>videoon,graphon=>graphon);
	 
	    
	test: entity work.font_test_gen 
	port map(clk=>CLK,hpos=>hpos,vpos=>vpos,videoon =>videoon,texton=>texton,paron=>paron,par2on=>par2on);
	
	  
	RGB: entity work.RGB 
	port map(R=>R,G=>G,B=>B,texton=>texton,graphon=>graphon,paron=>paron,par2on=>par2on);
	
	
end behaviour;  