library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity led_blink is
    Port ( 
        CLK100MHZ : in  STD_LOGIC;         -- 100 MHz clock input
        LED       : out STD_LOGIC_VECTOR(15 downto 0);
        LED16_R     : out STD_LOGIC;
        LED16_G     : out STD_LOGIC;
        LED16_B     : out STD_LOGIC;
        LED17_R     : out STD_LOGIC;
        LED17_G     : out STD_LOGIC;
        LED17_B     : out STD_LOGIC
        -- SIGNAL NOT TIED TO RESIZE
--        RED_OUT     : out STD_LOGIC_VECTOR(7 downto 0);
--        GREEN_OUT   : out STD_LOGIC_VECTOR(7 downto 0);
--        BLUE_OUT    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end led_blink;

architecture Behavioral of led_blink is

    signal count : integer := 0;            -- Clock divider counter
    signal blink: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal current_led : integer := 0;
--    signal red, green, blue : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal pred1, pgreen1, pblue1 : STD_LOGIC := '0';
    signal pred2, pgreen2, pblue2 : STD_LOGIC := '0';

begin

    LED16_R <= pred1;
    LED16_G <= pgreen1;
    LED16_B <= pblue1;
    LED17_R <= pred2;
    LED17_G <= pgreen2;
    LED17_B <= pblue2;

    
    -- Clock divider process to create a 1 Hz blink
    process(CLK100MHZ)
    begin
        if rising_edge(CLK100MHZ) then
            if count = 50000000 then  -- 100 MHz / 2 = 50 MHz -> Divide by 50 million for 1 Hz ;; 50_000_000
                count <= 0;
                blink <= (others => '0');
                blink(current_led) <= '1';
                current_led <= (current_led + 1) mod 16;
                
                -- RGB 
                
                pred1 <= '1';
                
                
            else
                count <= count + 1;  -- Increment the counter
            end if;
        end if;
    end process;
    

    -- Output the blink signal to the LED vector (16 LEDs)
    LED <= blink;
 

end Behavioral;
