library ieee;
use ieee.std_logic_1164.all;

entity mde_coracao is
   port(ck, rst, SW0, SW1, pa, pv, tc, tb : in  std_logic;
                                        q : out std_logic_vector(2 downto 0)
   );
end mde_coracao;

architecture logic of mde_coracao is

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
          if (SW0 = '1' and tc = '1')    then estado <= CA; 
          elsif (SW0 = '0' and pa = '1') then estado <= RTV;
          else                                estado <= EA;
          end if;

        when CA =>                         
          estado <= RTV;

        when RTV =>                         
          estado <= EV;

        when EV =>                         
          if (SW1 = '1' and tb = '1')    then estado <= CV; 
          elsif (SW1 = '0' and pv = '1') then estado <= RTA;
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








