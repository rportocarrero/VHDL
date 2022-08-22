library ieee;
use ieee.numeric_std.all;

entity zgain is
    generic( n : integer := 8;
        gain : signed
    );
    port (
        zin : in signed (n-1 downto 0);
        zout : out signed (n-1 downto 0)
    );
end entity zgain;

architecture zdomain of zgain is
begin
    p1 : process(zin)
        variable product : signed (2*n-1 downto 0);
    begin
        product := zin * gain;
        zout <= product (n-1 downto 0);
    end process p1;
end architecture zdomain;
