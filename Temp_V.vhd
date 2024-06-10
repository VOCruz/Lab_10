library ieee;
use ieee.std_logic_1164.all;

entity Temp_V is
   port(ck, tv : in  std_logic;
            tb : out std_logic
   );
end Temp_V;

architecture logic of Temp_V is

   component Reg_5 is
      port(ck, reset : in  std_logic;
                   t : in  std_logic_vector(4 downto 0);
                   s : out std_logic_vector(4 downto 0)
      );
   end component;

   component Decrementador is
      port( A:  in std_logic_vector(4 downto 0);
	    S: out std_logic_vector(4 downto 0)
      );
   end component;

   component Comp_5bits is
      port(A, B : in  std_logic_vector(4 downto 0);
              S : out std_logic
      );
   end component;

   signal s_reg, s_dec : std_logic_vector(4 downto 0);

begin

   R : Reg_5 port map(ck, tv, s_dec, s_reg);
   D : Decrementador port map(s_reg, s_dec);
   C : Comp_5bits port map(s_reg, "00000", tb);

end logic;








