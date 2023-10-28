library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionBuffer is
    Port ( clk : in  STD_LOGIC;
           instr_in : in  STD_LOGIC_VECTOR (31 downto 0);
           instr_valid : in  STD_LOGIC;
           instr_out : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionBuffer;

architecture Behavioral of InstructionBuffer is
  type instruction_queue is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
  signal queue : instruction_queue;
  signal queue_head, queue_tail : integer range 0 to 31 := 0;
begin
  process(clk)
  begin
    if (clk'event and clk = '1') then
      if (instr_valid = '1') then
        queue(queue_tail) <= instr_in;
        queue_tail <= (queue_tail + 1) mod 32;
      end if;
    end if;
  end process;
  
  instr_out <= queue(queue_head);
  
  process(clk)
  begin
    if (clk'event and clk = '1') then
      queue_head <= (queue_head + 1) mod 32;
    end if;
  end process;
end Behavioral;
