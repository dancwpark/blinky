library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_blink is
    Port ( 
        CLK100MHZ : in  STD_LOGIC;         -- 100 MHz clock input
        LED       : out STD_LOGIC_VECTOR(15 downto 0)
    );
end led_blink;

architecture Behavioral of led_blink is

    signal count : integer := 0;            -- Clock divider counter
    signal blink1 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- LED blinking signal
    signal blink2 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal current_state : boolean := False;

begin

    -- Clock divider process to create a 1 Hz blink
    process(CLK100MHZ)
    begin
        if rising_edge(CLK100MHZ) then
            if count = 50000000 then  -- 100 MHz / 2 = 50 MHz -> Divide by 50 million for 1 Hz
                count <= 0;
                current_state <= not current_state;
            else
                count <= count + 1;  -- Increment the counter
            end if;
        end if;
    end process;
    
    -- current state process
    process(current_state)
    begin
        if current_state = false then
            blink1 <= (others => '1');
            blink2 <= (others => '0');
        else
            blink1 <= (others => '0');
            blink2 <= (others => '1');
        end if;
    end process;

    -- Output the blink signal to the LED vector (16 LEDs)
    LED <= (blink1 & blink2);

end Behavioral;
