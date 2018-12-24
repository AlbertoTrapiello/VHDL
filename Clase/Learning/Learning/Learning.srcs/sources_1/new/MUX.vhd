library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY mux IS 
    PORT(
        a,b,s: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END ENTITY mux;

ARCHITECTURE structural OF mux IS

    COMPONENT inv IS
        PORT(
            i: IN STD_LOGIC;
            o: OUT STD_LOGIC);
    END COMPONENT;        
    COMPONENT and2 IS
        PORT(
             a,b: IN STD_LOGIC;
             y: OUT STD_LOGIC);  
    END COMPONENT;             
    COMPONENT or2 IS
        PORT(
            a,b: IN STD_LOGIC;
            y: OUT STD_LOGIC);  
    END COMPONENT;          
            
    SIGNAL NS, A_NS, B_S:std_logic;                                
BEGIN
    u1a: inv PORT MAP (S,NS);
    u2a: and2 port map(NS, A, A_NS);
    u2b: and2 port map(S, B, B_S);
    u3a: or2 port map(A_NS, B_S, Y);
    
END ARCHITECTURE;


