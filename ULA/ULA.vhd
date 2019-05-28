----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:03 05/21/2019 
-- Design Name: 
-- Module Name:    ULA - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ULA is
    Port ( selection : in STD_LOGIC_VECTOR (3 downto 0);
			  x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end ULA;

	architecture Behavioral of ULA is

component addOne is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component andGate is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component fourBitAdder is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           ovFlag : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component fourBitSubtractor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           borrowFlag : out  STD_LOGIC;
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component notGate is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component orGate is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component twosComplementer is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component xorGate is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out  STD_LOGIC;
           signFlag : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL addOneOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL andGateOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL fourBitAdderOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL fourBitSubtractorOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL notGateOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL orGateOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL twosComplementerOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL xorGateOutput : STD_LOGIC_VECTOR (3 downto 0);

-- SIGNAL addOneOutput, andGateOutput, fourBitAdderOutput, fourBitSubtractorOutput, notGateOutput, orGateOutput, twosComplementerOutput, xorGateOutput : STD_LOGIC_VECTOR (3 downto 0);

SIGNAL addOneCOut, fourBitAdderCOut, fourBitSubtractorCOut : STD_LOGIC;
SIGNAL addOneZeroFlag, andGateZeroFlag, fourBitAdderZeroFlag, fourBitSubtractorZeroFlag, notGateZeroFlag, orGateZeroFlag, twosComplementerZeroFlag, xorGateZeroFlag : STD_LOGIC;
SIGNAL addOneSignFlag, andGateSignFlag, fourBitAdderSignFlag, fourBitSubtractorSignFlag, notGateSignFlag, orGateSignFlag, twosComplementerSignFlag, xorGateSignFlag : STD_LOGIC;
SIGNAL addOneOVFlag, fourBitAdderOVFlag, fourBitSubtractorOVFlag : STD_LOGIC;

begin

addOneLabel: addOne port map (x, addOneCOut, addOneZeroFlag, addOneSignFlag, addOneOVFlag, addOneOutput);
andGateLabel: andGate port map(x, y, andGateZeroFlag, andGateSignFlag, andGateOutput);
fourBitAdderLabel: fourBitAdder port map (x, y, '0', fourBitAdderCOut, fourBitAdderZeroFlag, fourBitAdderSignFlag, fourBitAdderOVFlag, fourBitAdderOutput);
fourBitSubtractorLabel : fourBitSubtractor port map (x, y, fourBitSubtractorcout, fourBitSubtractorzeroFlag, fourBitSubtractorsignFlag, fourBitSubtractoroutput);
notGateLabel : notGate port map (x, notGatezeroFlag, notGatesignFlag, notGateoutput);
orGateLabel : orGate port map (x, y, orGatezeroFlag, orGatesignFlag, orGateoutput);
twosComplementerLabel : twosComplementer port map (x, twosComplementerzeroFlag, twosComplementersignFlag, twosComplementeroutput);
xorGateLabel : xorGate port map (x, y, xorGatezeroFlag, xorGatesignFlag, xorGateOutput);

process(selection, addOneOutput, andGateOutput, fourBitAdderOutput, fourBitSubtractorOutput, notGateOutput, orGateOutput, twosComplementerOutput, xorGateOutput)

begin
	case selection is
		when "0000" => -- addOne
			cout <= addOneZeroFlag;
			zeroFlag <= addOneZeroFlag;
			signFlag <= addOneSignFlag;
			ovFlag <= addOneOVFlag;
			output <= addOneOutput;
		when "0001" => -- andGate
			cout <= '0';
			zeroFlag <= andGateZeroFlag;
			signFlag <= andGateSignFlag;
			ovFlag <= '0';
			output <= andGateOutput;
		when "0010" => -- fourBitAdder
			cout <= fourBitAdderCOut;
			zeroFlag <= fourBitAdderZeroFlag;
			signFlag <= fourBitAdderSignFlag;
			ovFlag <= fourBitAdderOVFlag;
			output <= fourBitAdderOutput;
		when "0011" => -- fourBitSubtractor
			cout <= fourBitSubtractorCOut;
			zeroFlag <= fourBitSubtractorZeroFlag;
			signFlag <= fourBitSubtractorSignFlag;
			ovFlag <= fourBitSubtractorOVFlag;
			output <= fourBitSubtractorOutput;
		when "0100" => -- notGate
			cout <= '0';
			zeroFlag <= notGateZeroFlag;
			signFlag <= notGateSignFlag;
			ovFlag <= '0';
			output <= notGateOutput;
		when "0101" => -- orGate
			cout <= '0';
			zeroFlag <= orGateZeroFlag;
			signFlag <= orGateSignFlag;
			ovFlag <= '0';
			output <= orGateOutput;
		when "0110" => -- twosComplementer
			cout <= '0';
			zeroFlag <= twosComplementerZeroFlag;
			signFlag <= twosComplementerSignFlag;
			ovFlag <= '0';
			output <= twosComplementerOutput;
		when others => -- xorGate
			cout <= '0';
			zeroFlag <= xorGateZeroFlag;
			signFlag <= xorGateSignFlag;
			ovFlag <= '0';
			output <= xorGateOutput;

			
	end case;
	end process;

end Behavioral;