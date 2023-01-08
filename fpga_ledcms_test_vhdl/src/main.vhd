----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2022 02:49:14 PM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity main is
  Port ( 
        sys_rst_n :in std_logic;
        sys_clk :in std_logic;
        led :out std_logic
     );
end main;


architecture Behavioral of main is

    signal clk_1_hz: std_logic :='0';
    signal sig_led: std_logic :='0';
    signal compteur_clock : std_logic_vector (23 downto 0):=(others=>'0');
    
    

    begin
           
    --Wiring
    led<=sig_led;

    --Process
    process(sys_clk,sys_rst_n)
    begin
    if(sys_rst_n='0') then
        compteur_clock<=(others=>'0');
    elsif(rising_edge (sys_clk)) then
        compteur_clock<=std_logic_vector(unsigned(compteur_clock)+1);
        if(compteur_clock="000000000000000000000000") then
            clk_1_hz<= not clk_1_hz;
        end if;
    end if;
    end process;

    process(clk_1_hz,sys_rst_n)
    begin
    if(sys_rst_n='0') then
        sig_led<='0';
    elsif(rising_edge (clk_1_hz)) then
        sig_led<=not sig_led;
    end if;
    end process;

end Behavioral;
