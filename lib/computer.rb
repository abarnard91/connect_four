class Computer
  attr_accessor :chip, :score
  def initialize(score = 0)
    @score = score
    @winner = false
    @chip = "\u263B" #black chip
  end

  def computer_move
    move = rand(1..7)
    return move
  end

  def to_json
    File.write("computer_save.json", JSON.dump({:score => @score}))
  end

  def self.from_json(save)
    save_file = File.read(save)
    data = JSON.parse(save_file)
    self.new(data['score'])
  end

end