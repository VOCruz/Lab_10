library ieee;
use ieee.std_logic_1164.all;

entity Comp_5bits is
   port(A, B : in  std_logic_vector(4 downto 0);
           S : out std_logic
   );
end Comp_5bits;

architecture logic of Comp_5bits is

   signal e4, e3, e2, e1, e0 : std_logic;

begin

   e4 <= A(4) xnor B(4);
   e3 <= A(3) xnor B(3);
   e2 <= A(2) xnor B(2);
   e1 <= A(1) xnor B(1);
   e0 <= A(0) xnor B(0);

   S <= e4 and e3 and e2 and e1 and e0;

end logic;








