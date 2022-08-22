library ieee;
use ieee.numeric_std.all;

entity zdiv2 is
    generic (n : integer := 8);
    port (
        zin : in signed (n-1 downto 0);
        zout : out signed (n-1 downto 0);
    );
end entity zdiv2;

architeture zdomain of zdiv2 is
begin
    zout <= zin srl 1;
end architecture zdomain;
