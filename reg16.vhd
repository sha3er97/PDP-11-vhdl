LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity reg16 is
    port(
        d : IN std_logic_vector(15 DOWNTO 0);
        Clk,Rst : IN std_logic;
        q   : OUT std_logic_vector(15 DOWNTO 0));
end reg16;

ARCHITECTURE arch OF reg16 IS
BEGIN
PROCESS (Clk,Rst)
BEGIN
IF Rst = '1' THEN
		q <= (OTHERS=>'0');
ELSIF rising_edge(Clk) THEN
		q <= d;
END IF;
END PROCESS;
END arch;