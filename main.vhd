library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_blink is
    Port ( 
        CLK100MHZ : in  STD_LOGIC;         -- 100 MHz clock input
        LED       : out STD_LOGIC_VECTOR(15 downto 0)  -- 16 LEDs output
    );
end led_blink;

architecture Behavioral of led_blink is

    signal count : integer := 0;            -- Clock divider counter
    signal blink : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');  -- LED blinking signal

begin

    -- Clock divider process to create a 1 Hz blink
    process(CLK100MHZ)
    begin
        if rising_edge(CLK100MHZ) then
            if count = 50000000 then  -- 100 MHz / 2 = 50 MHz -> Divide by 50 million for 1 Hz
                count <= 0;
                blink <= not blink;  -- Toggle the blink signal (invert all LED states)
            else
                count <= count + 1;  -- Increment the counter
            end if;
        end if;
    end process;

    -- Output the blink signal to the LED vector (16 LEDs)
    LED <= blink;

end Behavioral;
