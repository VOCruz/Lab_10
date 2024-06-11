library ieee;
use ieee.std_logic_1164.all;

entity c_estados is
   port(             q : in  std_logic_vector(2 downto 0);
        sa, sv, ta, tv : out std_logic
   );
end c_estados;

architecture logic of c_estados is

begin

   sa <= not(q(2)) and     q(1)  and not(q(0));
   sv <=     q(2)  and not(q(1)) and     q(0);
   ta <= not(q(2)) and not(q(1)) and not(q(0));
   tv <= not(q(2)) and     q(1)  and     q(0);

end logic;









