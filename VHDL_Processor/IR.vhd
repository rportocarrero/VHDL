library ieee;
use ieee.std_logic_1164.all;
use work.processor_functions.all;
entity ir is
    port (
        clk : in std_logic;
        nrst : in std_logic;
        ir_load : in std_logic;
        ir_valid : in std_logic;
        ir_address : in std_logic;
        ir_opcode : out opcode;
        ir_bus : inout std_logic_vector(n-1 downto 0)
    );
end entity ir;

architecture rtl of ir is
    signal ir_internal : std_logic_vector (n-1 downto 0);
begin
    ir_bus <= ir_internal
when ir_valid = 1 else (others => z);
    ir_opcode <= decode(ir_internal);
    process (clk nrst) is
    begin
        if nrst = 0 then
            ir_internal <= (others => 0);
        elsif rising_edge(clk) then
            if ir_load = 1 then
                ir_internal <= ir_bus;
            end if;
        end if;
    end process;
end architecture rtl;