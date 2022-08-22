library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity tb;

architecture testbench of tb is

    signal clk : std_logic := '0';
    signal x : signed (7 downto 0) := X"00";
    signal y : signed (7 downto 0) := X"00";
    signal y1 : signed (7 downto 0) := X"00";
    signal yd: signed (7 downto 0) := X"00";
    signal yd2 : signed (7 downto 0) := X"00";
    signal x2 : signed (7 downto 0) := X"00";

    component zsum
    generic (
        n : integer := 8
    );
    port (
        signal zin1 : in signed(n-1 downto 0);
        signal zin2 : in signed(n-1 downto 0);
        signal zout : out signed(n-1 downto 0)
    );
    end component;
    for all : zsum use entity work.zsum;

    component zdiff
    generic (
        n : integer := 8
    );
    port (
        signal zin1 : in signed(n-1 downto 0);
        signal zin2 : in signed(n-1 downto 0);
        signal zout : out signed(n-1 downto 0)
    );
    end component;
    for all : zdiff use entity work.zdiff;

    component zdiv2
    generic(
        n : integer := 8
    );
    port (
        signal zin : in signed (n-1 downto 0);
        signal zout : out signed (n-1 downto 0)
    );
    end component;
    for all : zdiv2 use entity work.zdiv2;

    component zdelay
    generic(
        n : integer := 8
    );
    port (
        signal clk : in std_logic;
        signal zin : in signed(n-1 downto 0);
        signal zout : out signed(n-1 downto 0)
    );
    end component
    for all : zdelay use entity work.zdelay;

begin
    clk <= not clk after 1 us;
    
    GAIN1 : zdiv2 generic map (8) port map (x, x2);
    GAIN2 : zdiv2 generic map (8) port map (yd, yd2);
    SUM1 : zsum generic map (8) port map (x2, yd2, y);
    D1 : zdelay generic map (8) port map (clk, y, yd);

    x <= X"00", X"0F" after 10 us;
end architecture testbench;