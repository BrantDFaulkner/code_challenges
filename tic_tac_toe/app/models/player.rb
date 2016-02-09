
class Player

  attr_accessor :human, :marker, :name

  def initialize(options = {})
    @human = options[:human]
    @name = options[:name] || select_name
    @marker = nil
  end

private

  def select_name
      ["Thing","Grand Napoleon","Yggdrasil","Lingo","Aleph","FLORANCE","Abraham","Helen","Hex","Prime Intellect","SEED","FIDO","Ordinator","TRANSLTR","Luminous","Ozymandias","Logris","Mother","Turing Hopper","Stormbreaker","Glooper","Gabriel","Antrax","Cohen","Sif","C Cube","Mack","Loki","Deep Winter","Endless Summer","Omnius","VIKI"].sample
  end

end#Player
