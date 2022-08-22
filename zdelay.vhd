library ieee;
using ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zdelay is
    generic (n : integer := 8);
    port(
        clk : in std_logic;
        zin : in signed (n-1 downto 0);
        zout : out signed (n-1 downto 0) := (others =>0 )
    );
end entity zdelay

architecture zdomain of zdelay is 
    signal lastzin : signed (n-1 downto 0) := (others => '0');
begin
    p1 : process(clk)
    begin
        if rising_edge(clk) then
            zout <= lastzin;
            lastzin <= zin;
        end if;
    end process p1;
end architecture zdomain;