library ieee;
use ieee.std_logic_1164.all;

entity Reg_5 is
   port(ck, reset : in  std_logic;
                t : in  std_logic_vector(4 downto 0);
                s : out std_logic_vector(4 downto 0)
   );
end Reg_5;

architecture logic of Reg_5 is

   component FF_D is
      port(ck, clr, set, d :  in std_logic;
			 q : out std_logic
      );
   end component;

   signal set, clr : std_logic := '1';
   signal rst : std_logic;

begin

   rst <= not(reset);

   F4 : FF_D port map(ck, rst, set, t(4), s(4));
   F3 : FF_D port map(ck, rst, set, t(3), s(3));
   F2 : FF_D port map(ck, clr, rst, t(2), s(2));
   F1 : FF_D port map(ck, rst, set, t(1), s(1));
   F0 : FF_D port map(ck, clr, rst, t(0), s(0));

end logic;








