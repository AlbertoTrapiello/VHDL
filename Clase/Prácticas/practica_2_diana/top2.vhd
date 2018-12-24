LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity top2 is
port( button, rst, clk: in std_logic;
    digsel: in std_logic_vector (3 downto 0);
    segment: out std_logic_vector (6 downto 0);
    digctrl: out std_logic_vector (3 downto 0));
end entity;

Architecture top2 of top2 is
    component sincronizador
        Port (
        sync_in: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        sync_out: OUT STD_LOGIC
        );
    end component;
    component debouncer
        port (
        clk : in std_logic;
        rst : in std_logic;
        btn_in : in std_logic;
        btn_out : out std_logic);
    END component;
    component contador
        port ( rst: in std_logic;
        boton: in std_logic;
        code: out std_logic_vector (3 downto 0));
    end component;
    component decoder
        PORT (
        code : IN std_logic_vector(3 DOWNTO 0);
        led: OUT std_logic_vector(6 DOWNTO 0)
        );
    end component;
    signal boton_sinc, boton_deb: std_logic;
    signal code: std_logic_vector (3 downto 0);
begin
    sinc: sincronizador port map (button, clk, boton_sinc);
    antireb: debouncer port map (clk, rst, boton_sinc, boton_deb);
    cont: contador port map (rst, boton_deb, code);
    dec: decoder port map (code, segment);
    digctrl <= not digsel;
end architecture;