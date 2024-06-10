library ieee;
use ieee.std_logic_1164.all;

entity B_Controle is
   port(ck, clr, sa, sv, tc, tb : in  std_logic;
                 pa, pv, ta, tv : out std_logic
   );
end B_Controle;

architecture logic of B_Controle is

   component mde_moore is
      port(ck, rst, sa, sv, tc, tb : in  std_logic;
                                 q : out std_logic_vector(2 downto 0)
      );
   end component;

   component s_estados is
      port(             q : in  std_logic_vector(2 downto 0);
           pa, pv, ta, tv : out std_logic
      );
   end component;

   signal q_aux: std_logic_vector(2 downto 0);

begin

   MDE : mde_moore port map(ck, clr, sa, sv, tc, tb, q_aux);

   S : s_estados port map(q_aux, pa, pv, ta, tv);

end logic;









