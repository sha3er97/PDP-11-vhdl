LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

USE IEEE.numeric_std.all;

ENTITY ram IS

PORT (clk : IN std_logic;

we : IN std_logic;

address : IN std_logic_vector(5 DOWNTO 0);

datain : IN std_logic_vector(15 DOWNTO 0);

dataout : OUT std_logic_vector(15 DOWNTO 0) );

END ENTITY ram;

ARCHITECTURE sync_ram_a OF ram IS

TYPE ram_type IS ARRAY(0 TO 63) of std_logic_vector(15 DOWNTO 0);

SIGNAL ram : ram_type := (
0 => X"0064",
1 => X"0065",
2 => X"0066",
3 => X"0067",
4 => X"0068",
5 => X"0069",
6 => X"006A",
7 => X"006B",
8 => X"006C",
9 => X"006D",
OTHERS => X"0000"
);

BEGIN

PROCESS(clk) IS

BEGIN

IF rising_edge(clk) THEN

IF we = '1' THEN

ram(to_integer(unsigned((address)))) <= datain;

END IF;

END IF;

END PROCESS;

dataout <= ram(to_integer(unsigned((address))));

END sync_ram_a;