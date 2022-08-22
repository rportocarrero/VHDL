library ieee;
use ieee.std_logic_1164.all;
use work.processor_functions.all;
entity controller is
    generic (
        n : integer := 16
    );
    port (
        clk : in std_logic;
        nrst : in std_logic;
        ir_load : out std_logic;
        ir_valid : out std_logic;
        ir_address : out std_logic;
        pc_inc : out std_logic;
        pc_load : out std_logic;
        pc_valid : out std_logic;
        mdr_load : out std_logic;
        mar_load : out std_logic;
        mar_valid : out std_logic;
        m_en : out std_logic;
        m_rw : out std_logic;
        alu_cmd : out std_logic_vector(2 downto 0);
        control_bus : inout std_logic_vector(n-1 downto 0)
    );
end entity controller;

architecture rtl of controller is
    type states is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10);
    signal current_state, next_state : states;
begin 
    state_sequence : process(clk, nrst) is
        if nrst = 0 then
            current_state <= 0;
        else
            if rising_edge(clk) then
                current_state <= next_state;
            end if;
        end if;
    end process state_sequence;

    state_machine : process ( present_state, opcode) is
    begin
        -- reset all the control signals
        ir_load <= 0;
        ir_valid <= 0;
        ir_address <= 0;
        pc_inc <= 0;
        pc_load <= 0;
        pc_valid <= 0;
        mdr_load <= 0;
        mar_load <= 0;
        mar_valid <= 0;
        m_en <= 0;
        m_rw <= 0;
        case current_state is
            when s0 =>
                pc_valid <= 1;
                mar_load <= 1;
                pc_inc <= 1;
                pc_load <= 1;
                next_state <= s1;
            when s1 =>
                m_en <= 1;
                m_rw <= 1;
            when s2 => 
                mdr_valid <= 1;
                if_load <= 1;
                next_state <= s3;
            when s3 => 
                mar_load <= 1;
                ir_address <= 1;
                if opcode = store then
                    next_state <= s4;
                else
                    next_state <= s6;
                end if;
            when s4 =>
                mdr_load <= 1;
                acc_vaid <= 1;
                next_state <= s5;
            when s5 => 
                m_en <= 1;
                next_state <= s0;
            when s6 => 
                m_en <= 1;
                m_rw <= 1;
                if opcode = load then
                    next_state <= s7;
                else
                    next_state <= s8;
                end if
            when s7 =>
                mdr_valid <= 1;
                acc_load <= 1;
                next_state <= s0;
            when s8 =>
                m_en <= 1;
                m_rw <= 1;
                if opcode = add then
                    next_state <= s9;
                else
                    next_state <= s10;
                end if;
            when s9 =>
                alu_add <= 1;
                next_state <= s0;
            when s10 =>
                alu_sub <= 1;
                next_state <= s0;
        end case;
    end process state_machine;
end architecture;

