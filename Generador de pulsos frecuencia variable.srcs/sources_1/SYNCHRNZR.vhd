library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SYNCHRNZR is
 port (
 clk : in std_logic;
 async_in : in std_logic;
 sync_out : out std_logic;
 reset: in std_logic
 );
end SYNCHRNZR;
architecture BEHAVIORAL of SYNCHRNZR is
 signal sreg : std_logic_vector(1 downto 0); --Registro de 2 bits
begin
 process (CLK,reset)
 begin
 --CUANDO LA SE�AL DE RESET SE ACTIVA, SE LIMPIAN LA SALIDA Y
 --LOS VALORES DEL REGISTRO
 if (reset='0') then
 sync_out <= '0';
 sreg <="00";
 elsif rising_edge(CLK) then
 --CON CADA CICLO DE RELOJ LA SE�AL AS�NCRONA DE LA ENTRADA PASA AL REGISTRO,
 --EL SEGUNDO BIT DEL REGISTRO PASA A LA SALIDA, Y EL PRIMER BIT PASA A SER 
 --EL SEGUNDO BIT DEL REGISTRO
 sync_out <= sreg(1);
 sreg <= sreg(0) & async_in;
 end if;
 end process;
end BEHAVIORAL;


