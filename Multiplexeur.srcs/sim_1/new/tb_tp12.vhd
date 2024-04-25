library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_multiplexeur is
end tb_multiplexeur;

architecture tb_multi of tb_multiplexeur is
COMPONENT multiplexeur is
    Port ( sw_i : in STD_LOGIC_VECTOR (15 downto 0);
           led_o : out STD_LOGIC_VECTOR (15 downto 0));
end component;
Signal sw,led: std_logic_vector(15 downto 0):= (others => '0');

begin
Test : entity work.multiplexeur(multi)
port map(sw_i=>sw,led_o=>led);

STIMULUS : process
begin
    wait for 10 ns; 
    sw(14 downto 10)<="11111";sw(9 downto 5)<="00000";sw(15)<='0';
    wait for 10 ns;
    sw(14 downto 10)<="11111";sw(9 downto 5)<="00000";sw(15)<='1';
    wait for 10 ns;
    sw(14 downto 10)<="00000";sw(9 downto 5)<="11111";sw(15)<='0';
    wait for 10 ns;
    sw(14 downto 10)<="00000";sw(9 downto 5)<="11111";sw(15)<='1';
end process;
end tb_multi;