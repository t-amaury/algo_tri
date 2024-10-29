---------------------------------------------------------------------------------------------------
-- 
-- racine_carree.vhd
--
-- v. 1.0 Pierre Langlois 2022-02-25 laboratoire #4 INF3500 - code de base
-- v. 1.1 2024-07-29
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity racine_carree is
  generic (
    -- Nombre de bits de A
    N    : positive := 16
    -- Nombre de bits de X
    M    : positive := 8
    -- Nombre d'itÃ©rations Ã  faire
    kmax : positive := 11
    );
  port (
    reset, clk : in  std_logic;
    -- Le nombre dont on cherche la racine carrÃ©e
    i_A        : in  unsigned(N - 1 downto 0);
    -- Commande pour dÃ©buter les calculs
    i_go       : in  std_logic;
    -- La racine carrÃ© de A, telle que X * X = A
    o_X        : out unsigned(M - 1 downto 0);
    -- '1' quand les calculs sont terminÃ©s ==> la valeur de X est
    -- stable et correcte
    o_fini     : out std_logic
    );
end racine_carree;

architecture newton of racine_carree is
  constant W_frac : integer := 14;  -- pour le module de division, nombre de bits pour exprimer les rÃ©ciproques

  type etat_type is (attente, calculs);
  signal etat : etat_type := attente;

  --- votre code ici

begin
  -- diviseur : entity division_par_reciproque(arch)
  --   generic map(N, M, W_frac)
  --   port map(un-signal-ici, un-signal-ici, un-signal-ici, un-signal-ici);
  process(reset, clk) is
  begin
    if (reset = '1') then
        etat := attente;
    elsif (rising_edge(clk)) then
        if (etat = attente) then
            if (i_go) then
                k <='0';
                A_int <= i_A;
                o_X <= to_unsigned(255, o_X'length);
                etat <= calculs;
            end if;
        elsif (etat = calculs) then
            o_fini <= '0';
            o_x <= o_x;
            k+=1;
            if (k = kmax) then
                etat = attente
            end if;
        end if;
    end if;
  end process;

end newton;
