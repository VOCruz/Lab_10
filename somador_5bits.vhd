library ieee;
use ieee.std_logic_1164.all;

entity somador_5bits is 
	port( A, B: in std_logic_vector(4 downto 0);
	         O: out std_logic_vector(4 downto 0);
	      Cout: out std_logic);
end somador_5bits;

architecture logic of somador_5bits is

component somador is
  port(A, B, Cin: in std_logic;
	 O, Cout: out std_logic);
end component;

  signal aux0 : std_logic;
  signal aux1 : std_logic;
  signal aux2 : std_logic;
  signal aux3 : std_logic; 

begin
	
    X1: somador port map(A(0), B(0), '0', O(0), aux0);
    X2: somador port map(A(1), B(1), aux0, O(1), aux1);
    X3: somador port map(A(2), B(2), aux1, O(2), aux2);
    X4: somador port map(A(3), B(3), aux2, O(3), aux3);
    X5: somador port map(A(4), B(4), aux3, O(4), Cout);
 
end logic;
