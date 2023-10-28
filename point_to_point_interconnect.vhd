library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity interconnect is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           component_0_data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           component_0_valid_in : in  STD_LOGIC;
           component_1_data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           component_1_valid_in : in  STD_LOGIC;
           component_2_data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           component_2_valid_in : in  STD_LOGIC;
           component_3_data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           component_3_valid_in : in  STD_LOGIC;
           component_0_data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           component_0_valid_out : out  STD_LOGIC;
           component_1_data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           component_1_valid_out : out  STD_LOGIC;
           component_2_data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           component_2_valid_out : out  STD_LOGIC;
           component_3_data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           component_3_valid_out : out  STD_LOGIC);
end interconnect;

architecture Behavioral of interconnect is
begin

process (clk, rst)
begin
    if (rst = '1') then
        component_0_data_out <= (others => '0');
        component_0_valid_out <= '0';
        component_1_data_out <= (others => '0');
        component_1_valid_out <= '0';
        component_2_data_out <= (others => '0');
        component_2_valid_out <= '0';
        component_3_data_out <= (others => '0');
        component_3_valid_out <= '0';
    elsif (clk'event and clk = '1') then
        component_0_data_out <= component_1_data_in when component_1_valid_in = '1' else component_0_data_out;
        component_0_valid_out <= component_1_valid_in when component_1_valid_in = '1' else component_0_valid_out;
        component_1_data_out <= component_2_data_in when component_2_valid_in = '1' else component_1_data_out;
        component_1_valid_out <= component_2_valid_in when component_2_valid_in = '1' else component_1_valid_out;
        component_2_data_out <= component_3_data_in when
