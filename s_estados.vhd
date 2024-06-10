library ieee;
use ieee.std_logic_1164.all;

entity s_estados is
   port(             q : in  std_logic_vector(2 downto 0);
        pa, pv, ta, tv : out std_logic
   );
end s_estados;

architecture logic of s_estados is

begin

   pa <= not(q(2)) and     q(1)  and not(q(0));
   pv <=     q(2)  and not(q(1)) and     q(0);
   ta <= not(q(2)) and not(q(1)) and not(q(0));
   tv <= not(q(2)) and     q(1)  and     q(0);

end logic;



