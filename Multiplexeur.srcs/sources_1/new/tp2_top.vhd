library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexeur is
    Port ( sw_i : in STD_LOGIC_VECTOR (15 downto 0);
           led_o : out STD_LOGIC_VECTOR (15 downto 0));
end multiplexeur;

architecture multi of multiplexeur is
Signal x,y,m : std_logic_vector(4 downto 0):= (others => '0');
Signal s : std_logic;

begin
--Affectation switch & led
led_o(15 downto 5) <= sw_i(15 downto 5);
led_o(4 downto 0) <= m;

-- Définir les valeurs de X, Y et S
x <= sw_i(14 downto 10);
y <= sw_i(9 downto 5);
s <= sw_i(15);

-- Pilotage de la sortie
Multiplexeur : process(s,x,y)
begin
if (s = '0') then
    m <= x;
else
    m <= y;
end if;
end process;
end multi;