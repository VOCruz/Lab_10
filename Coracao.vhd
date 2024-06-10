library ieee;
use ieee.std_logic_1164.all;

entity Coracao is
   port( ck, clr, SW0, SW1, pa, pv : in  std_logic;
        sa, sv, lsa, lsv, lpa, lpv : out std_logic
   );
end Coracao;

architecture logic of Coracao is

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

   signal or_A, or_V, s_Ta, s_Tv : std_logic;

begin

   or_A <= (not(SW0) or pa or s_Tv);
   or_V <= (not(SW1) or pv or s_Ta);

   TA : Temp_A port map(ck, or_A, s_Ta);
   TV : Temp_V port map(ck, or_V, s_Tv);

   sa <= s_Ta;
   sv <= s_Tv;

   lsa <= s_Ta;
   lsv <= s_Tv;
   lpa <= pa;
   lpv <= pv;

end logic;









