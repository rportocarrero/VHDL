library ieee;
use ieee.numeric_std.all;

entity zsum is
    generic (n : integer := 8
    );
    port (
        zin1 : in signed (n-1 downto 0 );
        zin2 : in signed (n-1 downto 0);
        zout : out signed (n-1 downto 0)
    );
end entity zsum;

architecture zdomain of zsum is
begin
    p1 : process(zin)
        variable zsum : signed (2*n-1 downto 0);
    begin
        zsum := zin1 + zin2;
        zout <= zsum (n-1 downto 0);
    end process p1;
end architecture zdomain;