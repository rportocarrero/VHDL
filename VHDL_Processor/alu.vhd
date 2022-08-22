library ieee;
use ieee.std_logic_1164.all;
use work.processor_functions.all;
entity alu is 
    port(
        clk : in std_logic;
        nrst : in std_logic;
        alu_cmd : in std_logic_vector(2 downto 0);
        alu_zero : out std_logic;
        alu_valid : in std_logic;
        alu_bus : inout std_logic_vector(n-1 downto 0)
    );
end entity alu;

architecture rtl of alu is
    signal acc : std_logic_vector(n-1 downto 0)
begin
    alu_bus <= acc
when acct_valid = 1 else (others => z);
    alu_zero <= 1 when acc = reg_zero else 0;
    process (clk, nrst) is
    begin
        if nrst = 0 then
            acc <= (others => 0);
        elsif rising_edge(clk) then
            case acc_cmd is
            -- load the bus value into the accumulator
            when 000 => acc <= alu_bus;
            -- add the acc to the bus value
            when 001 => acc <= add(acc.alu_bus);
            -- add the acc to the bus value
            when 010 => acc <= not alu_bus;
            -- or the acc to the bus value
            when 011 => acc <= acc or alu_bus;
            -- and the acc to the bus value
            when 100 => acc <= acc and alu_bus;
            -- xor the acc to the bus value
            when 101 => acc <= acc xor alu_bus;
            -- increment acc
            when 110 => acc <= acc + 1;
            -- store the acc value
            when 111 => alu_bus <= acc;
        end if;
    end process;
end architecture rtl;
