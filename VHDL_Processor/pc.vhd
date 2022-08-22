library ieee;
use ieee.std_logic_1164.all;
entity pc is
    port (
        clk : in std_logic;
        nrst : in std_logic;
        pc_inc : in std_logic;
        pc_load : in std_logic;
        pc_valid : in std_logic;
        pc_bus : inout std_logic_vector(n-1 downto 0)
    );
end entity pc;

architecture rtl of pc is
    signal counter : unsigned (n-1 downto 0);
begin
    pc_bus <= std_logic_vector(counter)
when pc_valid = 1 else (others => z);
    process (clk, nrst) is
    begin
        if nrst = 0 then
            count <= 0;
        elsif rising_edge(clk) then
            if pc_inc = 1 then
                count <= count + 1;
            else 
                if pc_load = 1 then
                    count <= unsigned(pc_bus);
                end if;
            end if;
        end if;
    end process;
end architecture rtl;