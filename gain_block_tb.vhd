libary ieee;
use ieee.std_logic_1164.all;

entity tb is
end entity tb;

architecture testbench of tb is

    signal clk : std_logic := '0';
    signal dir : std_logic := '0';
    signal zin : signed (7 downto 0) := X"00";
    signal zout : signed (7 downto 0) := X"00";

    component zgain
    generic (
        n : integer := 8;
        gain : signed := X"02"
    );
    port (
        signal zin : in signed (n-1 downto 0);
        signal zout : out signed(n-1 downto 0)
    );
    end component;
    for all : zgain use entity work.zgain;

begin
    clk <= not clk after 1 is;

    DUT : zgain generic map (8, x"02") port map (zin, zout);

    p1 : process (clk)
    begin
        zin <= zin + 1;
    end process p1;
end architecture testbench;