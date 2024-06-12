library ieee;
use ieee.std_logic_1164.all;

entity Lab_10 is
   port(ck, clr, SW0, SW1, SW17 : in  std_logic;
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

   component ck_div_100 is
      port (ck_in : in  std_logic;
            ck_out: out std_logic);
   end component;

   component Mux_2x1 is
      port(E1, E0 :  in std_logic;
               k0 :  in std_logic;
                S : out std_logic
      );
   end component;

   signal clock, clock_100, clk, n_clr, sa_aux, sv_aux, pa_aux, pv_aux : std_logic;

begin

   n_clr <= clr;

   C_D : ck_div port map(ck, clock);
   C_D_100 : ck_div_100 port map(ck, clock_100);

   Mux : Mux_2x1 port map(clock_100, clock, SW17, clk);

   C : Coracao port map(clk, n_clr, SW0, SW1, pa_aux, pv_aux, sa_aux, sv_aux, lsa, lsv, lpa, lpv);

   M : Marcapasso port map(clk, n_clr, sa_aux, sv_aux, pa_aux, pv_aux);

end logic;








