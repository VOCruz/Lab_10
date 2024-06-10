library ieee;
use ieee.std_logic_1164.all;

entity mde_moore is
   port(ck, rst, sa, sv, tc, tb : in  std_logic;
                              q : out std_logic_vector(2 downto 0)
   );
end mde_moore;

architecture logic of mde_moore is

  type st is (RTA, EA, CA, RTV, EV, CV);  
  signal estado : st;
                          
begin

  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= RTA;                   
    elsif (ck'event and ck ='1') then    
      case estado is
        when RTA =>                         
          estado <= EA;

        when EA =>                         
          if sa = '1'                   then estado <= RTV; 
          elsif (sa = '0' and tc = '1') then estado <= CA;
          --else estado <= EA;
          end if;

        when CA =>                         
          estado <= RTV;

        when RTV =>                         
          estado <= EV;

        when EV =>                         
          if sv = '1'                   then estado <= RTA; 
          elsif (sv = '0' and tb = '1') then estado <= CV;
          --else estado <= EV;
          end if;

        when CV =>                         
          estado <= RTA;

       end case;
    end if;
  end process;

  with estado select  
    q <= "000" when RTA,
         "001" when EA, 
         "010" when CA,
         "011" when RTV,
         "100" when EV, 
         "101" when CV;

end logic;








