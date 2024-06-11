library ieee;
use ieee.std_logic_1164.all;

entity Coracao is
   port( ck, clr, SW0, SW1, pa, pv : in  std_logic;
        sa, sv, lsa, lsv, lpa, lpv : out std_logic
   );
end Coracao;

architecture logic of Coracao is

   component mde_coracao is
      port(ck, rst, SW0, SW1, pa, pv, tc, tb : in  std_logic;
                                           q : out std_logic_vector(2 downto 0)
      );
   end component;

   component c_estados is
      port(             q : in  std_logic_vector(2 downto 0);
           sa, sv, ta, tv : out std_logic
      );
   end component;

   component C_Temp_A is
      port(ck, ta : in  std_logic;
               tc : out std_logic
      );
   end component;

   component C_Temp_V is
      port(ck, tv : in  std_logic;
               tb : out std_logic
      );
   end component;

   --signal or_A, or_V, s_Ta, s_Tv : std_logic;
   signal s_Ta, s_Tv, sa_aux, sv_aux, ta_aux, tv_aux : std_logic;
   signal q_aux : std_logic_vector(2 downto 0);

begin

   MDE : mde_coracao port map(ck, clr, SW0, SW1, pa, pa, s_Ta, s_Tv, q_aux);
   c_e : c_estados port map(q_aux, sa_aux, sv_aux, ta_aux, tv_aux);
   TA : C_Temp_A port map(ck, ta_aux, s_Ta);
   TV : C_Temp_V port map(ck, tv_aux, s_Tv);

   sa <= sa_aux;
   sv <= sv_aux;
   lsa <= sa_aux;
   lsv <= sv_aux;
   lpa <= pa;
   lpv <= pv;

   --or_A <= (not(SW0) or pa or s_Tv or clr);
   --or_V <= (not(SW1) or pv or s_Ta);

   --TA : Temp_A port map(ck, or_A, s_Ta);
   --TV : Temp_V port map(ck, or_V, s_Tv);

   --sa <= s_Ta;
   --sv <= s_Tv;

   --lsa <= s_Ta;
   --lsv <= s_Tv;
   --lpa <= pa;
   --lpv <= pv;

end logic;









