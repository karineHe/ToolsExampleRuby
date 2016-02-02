class GenerateTable < Prawn::Table

  def initialize(data)
    table(data, width: 100)
  end

  
end
