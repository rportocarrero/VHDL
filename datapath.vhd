library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           instr_in : in  STD_LOGIC_VECTOR (31 downto 0);
           instr_valid : in  STD_LOGIC;
           reg_write : in  STD_LOGIC;
           mem_write : in  STD_LOGIC;
           ALU_op : in  STD_LOGIC_VECTOR (1 downto 0);
           operand_a : in  STD_LOGIC_VECTOR (31 downto 0);
           operand_b : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end Datapath;

architecture Behavioral of Datapath is
    component ALU is
        Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
               a : in  STD_LOGIC_VECTOR (31 downto 0);
               b : in  STD_LOGIC_VECTOR (31 downto 0);
               result : out  STD_LOGIC_VECTOR (31 downto 0));
    end component;

    component RegisterFile is
        Port ( clk : in  STD_LOGIC;
               reset : in  STD_LOGIC;
               write_enable : in  STD_LOGIC;
               write_data : in  STD_LOGIC_VECTOR (31 downto 0);
               read_address_a : in  STD_LOGIC_VECTOR (4 downto 0);
               read_address_b : in  STD_LOGIC_VECTOR (4 downto 0);
               operand_a : out  STD_LOGIC_VECTOR (31 downto 0);
               operand_b : out  STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal ALU_result : STD_LOGIC_VECTOR (31 downto 0);
begin
    u1: ALU
        port map (op => ALU_op, a => operand_a, b => operand_b, result => ALU_result);

    u2: RegisterFile
        port map (clk => clk, reset => reset, write_enable => reg_write,
                  write_data => ALU_result, read_address_a => operand_a,
                  read_address_b => operand_b, operand_a => operand_a, operand_b => operand_b);

    result <= ALU_result;
end Behavioral;
