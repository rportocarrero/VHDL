library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    generic(
        n : integer := 4
    ); 
    port(
        clk : in std_logic; 
        rst : in std_logic;
        output : out std_logic_vector((n-1) downto 0)
    );
end;

architecture simple of counter is
begin
    process(clk, rst)
        variable count : unsigned((n-1) downto 0);
    begin
        if rst = '0' then
            count  := (others => '0');
        elsif rising_edge(clk) then
            count := count + 1;
        end if;
        output <= std_logic_vector(count);
    end process;
end;