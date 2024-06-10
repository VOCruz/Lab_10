library ieee;
use ieee.std_logic_1164.all;

entity Marcapasso is
   port(ck, clr, sa, sv : in  std_logic;
                 pa, pv : out std_logic
   );
end Marcapasso;

architecture logic of Marcapasso is

   component B_Controle is
      port(ck, clr, sa, sv, tc, tb : in  std_logic;
                    pa, pv, ta, tv : out std_logic
      );
   end component;

   component Temp_A is
      port(ck, ta : in  std_logic;
               tc : out std_logic
      );
   end component;

   component Temp_V is
      port(ck, tv : in  std_logic;
               tb : out std_logic
      );
   end component;

   signal s_Ta, s_Tv, ta_aux, tv_aux : std_logic;

begin

   B_C : B_Controle port map(ck, clr, sa, sv, s_Ta, s_Tv, pa, pv, ta_aux, tv_aux);
   TA : Temp_A port map(ck, ta_aux, s_Ta);
   TV : Temp_V port map(ck, tv_aux, s_Tv);

end logic;

--force ck 0 0, 1 1 -repeat 2
--force clr 0 0 
--force sa 0 0, 1 4, 0 6
--force sv 0 0, 1 10, 0 12






