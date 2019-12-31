-----Font generating module

 -- Listing 13.2  
 library ieee;  
 use ieee.std_logic_1164.all;  
 use ieee.numeric_std.all;  
 
 
 entity font_test_gen is  
   port(  
    clk: in std_logic;  
    videoon: in std_logic;  
    hpos, vpos: in integer;  
	-- CH0 , CH1      : in std_logic_vector(11 downto 0);        -- CH0
	 --c2 , C4, C6 ,C2B, C4B, C6B  : in integer ;
	 texton , paron ,par2on: out std_logic
      );  
		
		
 end font_test_gen;  
 architecture arch of font_test_gen is  
   signal rom_addr: std_logic_vector(10 downto 0);  
   signal char_addr,char_addr_t,char_addr_p,char_addr_p2: std_logic_vector(6 downto 0);  
   signal row_addr,row_addr_t,row_addr_p,row_addr_p2: std_logic_vector(3 downto 0);  
   signal bit_addr,bit_addr_t,bit_addr_p,bit_addr_p2: std_logic_vector(2 downto 0);  
	signal text_on, par_on,par2_on : std_logic;
   signal font_word: std_logic_vector(7 downto 0);  
   signal font_bit, text_bit_on: std_logic;  
	signal pix_x,pix_y :  unsigned(9 downto  0) ; 
	
	signal score : integer := 0 ;

	
 begin  

 pix_x <= to_unsigned(hpos,10); 
 pix_y <= to_unsigned(vpos,10); 
 -- instantiate font ROM 	
 font_unit: entity work.font_rom  
   port map(clk=>clk, addr=>rom_addr, data=>font_word);  
  -- font ROM interface  
  -- char_addr<=pixel_y(5 downto 4) & pixel_x(7 downto 3);  
  --char_addr<= "1010000";
  -- row_addr<=pixel_y(3 downto 0);
  -- bit_addr<=pixel_x(2 downto 0);   
  -- "on" region limited to top-left corner  
  --  text_bit_on <=  
  -- font_bit when pixel_x(9 downto 7)=2 and  
  --          pixel_y(9 downto 6)="0000" else  
  --  '0';  
 
 --------------------------------------------
 --AN FPGA BASED DIGITAL OSCILLOSCOPE
 -------------------------------------------
  
 text_on  <= 
    '1'  when  pix_y(9  downto  5 ) = 0   and 
       (1<= pix_x(9  downto  4) and pix_x(9  downto  4) <=34) else  
    '0';
	 
 row_addr_t <= std_logic_vector(pix_y(4 downto 1)) ;  
 bit_addr_t <= std_logic_vector(pix_x(3 downto  1)) ;
 
 with pix_x(9 downto  4) select
      
		char_addr_t <= 		
		
		   "0000000" when  "000001",  ---SPACE
		   "0000000" when  "000010",  ---SPACE
			"0000000" when  "000011",  ---space
			"0000000" when  "000100",  ---SPACE
			"0000000" when  "000101",  ---SPACE
			"0000000" when  "000110",  ---SPACE
			"0000000" when  "000111",  ---SPACE
			"0000000" when  "001000",  ---space
			"0000000" when  "001001",  ---SPACE
			"0000000" when  "001010",  ---SPACE
			"0000000" when  "001011",  --- SPACE
			"0000000" when  "001100",  --- SPACE
			"0000000" when  "001101",  --- SPACE
			"0000000" when  "001110",  --- space
			"1010011" when  "001111",  --- S
			"1001000" when  "010000",  --- H
			"1000001" when  "010001",  --- A
			"1010000" when  "010010",  --- P
			"1000101" when  "010011",  --- E
			"1010011" when  "010100",  --- S
			"0000000" when  "010101",  --- SPACE
			"0000000" when  "010110",  --- space
		
			"0000000" when others;   ---



-------------------------------------------------
--PARAMETER DISPLAY
------------------------------------------------
 
par_on  <= 
    '1'  when  pix_y(9  downto  5 ) = 12   and 
       ( 1<= pix_x(9  downto  4) and pix_x(9  downto  4) <=39 ) else  
    '0';
	 
	 
row_addr_p <= std_logic_vector(pix_y(4 downto 1)) ;  
bit_addr_p <= std_logic_vector(pix_x(3 downto  1)) ;


with pix_x(9 downto  4) select
      char_addr_p <= 

			"0000000" when  "000001",  ---SPACE
		   "0000000" when  "000010",  ---SPACE
			"0000000" when  "000011",  ---SPACE
			"0000000" when  "000100",  ---SPACE
			"0000000" when  "000101",  ---SPACE
			"0000000" when  "000110",  ---SPACE
		   "0000000" when  "000111",  ---space,  
		 	"0000000" when  "001000",  ---SPACE
			"1010010" when  "001001",  ---R  
			"1000101" when  "001010",  ---E
			"1000011" when  "001011",  ---C
			"1010100" when  "001100",  ---T
			"1000001" when  "001101",  ---A
			"1001110" when  "001110",  ---N
			"1000111" when  "001111",  ---G
			"1001100" when  "010000",  ---L
			"1000101" when  "010001",  ---E
			"0000000" when  "010010",  ---space
			"0000000" when  "010011",  ---SPACE
			"0000000" when  "010100",  ---SPACE
			"0000000" when  "010101",  ---SPACE
			"0000000" when  "010110",  ---SPACE
			"0000000" when  "010111",  ---SPACE
			"0000000" when  "011000",  ---SPACE
			"1000011" when  "011001", --- C
			"1001001" when  "011010", --- I
			"1010010" when  "011011", --- R
			"1000011" when  "011100", --- C
			"1001100" when  "011101", --- L
			"1000101" when  "011110", --- E
			"0000000" when  "011111", --- space
			"0000000" when  "100000", --- space
			"0000000" when  "100001", --- space
			"0000000" when  "100010", --- space
			"0000000" when  "100011", --- space
			"0000000" when  "100100", --- space
			"0000000" when  "100101", --- space
			"0000000" when  "100110", --- space		
			"0000000" when others;   ---


-----------------------------------------------------------------------------------------	
			
par2_on  <= 
    '1'  when  pix_y(9  downto  5 ) = 14   and 
       ( 1<= pix_x(9  downto  4) and pix_x(9  downto  4) <=39 ) else  
    '0';
	 
	 
row_addr_p2 <= std_logic_vector(pix_y(4 downto 1)) ;  
bit_addr_p2 <= std_logic_vector(pix_x(3 downto  1)) ;



--		with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
					
			
		process (score)
			
			begin

			
			if score = 0 then
			
--				with pix_x(9 downto  4) select
--
--					char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000001" when  "010000",  ---space
--					"0000010" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--				
--			elsif scrore = 1 then 
--				
--				with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--		
--			
--			elsif scrore = 2 then 
--				with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--			
--				
--			elsif scrore = 3 then 
--			
--			with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--			
--				
--			elsif scrore = 4 then 
--			
--				
--			with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--					
--			elsif scrore = 5 then 
--				
--				with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--				
--			elsif scrore = 6 then 
--			
--			with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--			elsif scrore = 7 then
--			
--				with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--				
--			elsif scrore = 8 then
--				
--				with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
--					
--			elsif scrore = 9 then
--			
--			with pix_x(9 downto  4) select
--
--				char_addr_p2 <= 
--				
--					"0000000" when  "000001",  ---space
--					"0000000" when  "000010",  ---space
--					"0000000" when  "000011",  ---space			
--					"1001000" when  "000100",  ---H
--					"1001001" when  "000101",  ---I
--					"1000111" when  "000110",  ---G
--					"1001000" when  "000111",  ---H
--					"1010011" when  "001000",  ---S
--					"1000011" when  "001001",  ---C 
--					"1001111" when  "001010",  ---O 
--					"1010010" when  "001011",  ---R
--					"1000101" when  "001100",  ---E
--					"0000000" when  "001101",  ---space
--					"0111010" when  "001110",  --- :
--					"0000000" when  "001111",  ---space
--					"0000000" when  "010000",  ---space
--					"0000000" when  "010001",  ---space
--					"0000000" when  "010010",  ---space
--					"0000000" when  "010011",  ---space
--					"0000000" when  "010100",  ---space
--					"0000000" when  "010101",  ---space
--					"0000000" when  "010110",  ---space
--					"0000000" when  "010111",  ---space
--					"0000000" when  "011000",  ---space
--					"0000000" when  "011001", --- space
--					"0000000" when  "011010", --- space
--					"0000000" when  "011011", --- space
--					"0000000" when  "011100", --- space
--					"0000000" when  "011101", --- space
--					"0000000" when  "011110", --- space
--					"0000000" when  "011111", --- space
--					"0000000" when  "100000", --- space
--					"0000000" when  "100001", --- space
--					"0000000" when  "100010", --- space
--					"0000000" when  "100011", --- space
--					"0000000" when  "100100", --- space
--					"0000000" when  "100101", --- space
--					"0000000" when  "100110", --- space
--				
--					"0000000" when others;   ---
					
			end if ;
---------------------------------------------------------------------------------------------------------
		


		 end process;
		 
		 score <= 0 ;
 
   -- rgb multiplexing circuit  
   process(text_on,par_on ,par2_on,pix_x,pix_y,font_bit,char_addr_t,char_addr_p,char_addr_p2,row_addr_t,
	         row_addr_p,row_addr_p2,bit_addr_t,bit_addr_p,bit_addr_p2)  
   begin
	
    if text_on = '1' then  
       char_addr <= char_addr_t ;
		 row_addr <= row_addr_t ;
		 bit_addr <= bit_addr_t;
		    if font_bit = '1' then 
			    texton <= '1';
			else
			  texton <= '0';
			 end if;		 		 
	elsif par_on = '1' then  
       char_addr <= char_addr_p ;
		 row_addr <= row_addr_p ;
		 bit_addr <= bit_addr_p;
		    if font_bit = '1' then 
			    paron <= '1';
			 else
			    paron <= '0';
			 end if;
	elsif par2_on = '1' then  
       char_addr <= char_addr_p2 ;
		 row_addr <= row_addr_p2 ;
		 bit_addr <= bit_addr_p2;
		    if font_bit = '1' then 
			    par2on <= '1';
			 else
			    par2on <= '0';
			 end if;
	end if;		  		  
   end process;  
	
rom_addr <= char_addr & row_addr;  
font_bit <= font_word(to_integer(unsigned(not bit_addr)));  


end arch;  