library ieee;
use ieee.std_logic_1164.all;

entity Lab_10 is
   port(ck, clr, SW0, SW1 : in  std_logic;
             lsa, lsv, lpa, lpv : out std_logic
   );
end Lab_10;

architecture logic of Lab_10 is

   component Coracao is
      port( ck, clr, SW0, SW1, pa, pv : in  std_logic;
           sa, sv, lsa, lsv, lpa, lpv : out std_logic
      );
   end component;

   component Marcapasso is
      port(ck, clr, sa, sv : in  std_logic;
                    pa, pv : out std_logic
      );
   end component;

   component ck_div is
      port (ck_in : in  std_logic;
            ck_out: out std_logic);
   end component;

   signal clock, n_clr, sa_aux, sv_aux, pa_aux, pv_aux : std_logic;

begin

   n_clr <= clr;

   --C_D : ck_div port map(ck, clock);

   C : Coracao port map(ck, n_clr, SW0, SW1, pa_aux, pv_aux, sa_aux, sv_aux, lsa, lsv, lpa, lpv);

   M : Marcapasso port map(ck, n_clr, sa_aux, sv_aux, pa_aux, pv_aux);

end logic;








