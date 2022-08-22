library ieee;
use ieee.std_logiuc_1164.all;
use work.processor_functions.all;
entity memory is
    port (
        clk : in std_logic;
        nrst : in std_logic;
        mdr_load : in std_logic;
        mar_load : in std_logic;
        mar_valid : in std_logic;
        m_en : in std_logic;
        m_rw : in std_logic;
        mem_bus : inout std_logic_vector(n-1 downto 0)
    );
end entity memory;

architecture rtl of memorh is
    signal mdr : std_logic_vector(wordlen-1 downto 0);
    signal mar : unsigned(wordlen-oplen-1 downto 0);
begin
    mem_bus <= mdr
    when mem_valid = 1 else (others => z);
        process (clk, nrst) is
            variable contents : memory_array;
            constant program : contents := 
            (
                0 => 0000000000000011,
                1 => 0010000000000100,
                2 => 0001000000000101,
                3 => 0000000000001100,
                4 => 0000000000000011,
                5 => 0000000000000000,
                others => (others => 0)
            );
        begin
            if nrst = 0 then
                mdr <= (others => 0);
                mar <= (others => 0);
                contents := program;
            elsif rising_edge(clk) then
                if mar_load = 1 then
                    mar <= unsigned(mem_bus(n-oplen-1 downto 0));
                elsif mdr_load = 1 then
                    mdr <= mem_bus;
                elsif mem_en = 1 then
                    if mem_rw = 0 then
                        mdr <= contents(to_integer(mar));
                    else
                        mem(to_integer(mar)) := mdr;
                    end if;
                end if;
            end if;
        end process;
    end architecture rtl;