library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CounterTest is
end counterTest;

architecture stimulus of CounterTest is
    signal rst : std_logic := '0';
    signal clk : std_logic := '0';
    signal count : std_logic_vector (3 downto 0);

    component counter
        port(
            clk : in std_logic;
            rst : in std_logic;
            output : out std_logic_vector(3 downto 0)
        );
    end component;
    for all : counter use entity work.counter;

begin
    DUT : counter port map(clk=>clk,rst=>rst,output=>count);
    clk <= not clk after 1 us;
    process
    begin 
        rst<='0', '1' after 2.5 us;
        wait;
    end process;
end;