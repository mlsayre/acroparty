class Famroomacroletters < ActiveRecord::Base
  attr_accessible :let3, :let4, :let5, :let6, :let7

  def self.createletters
    @letterpool = ["A","A","A","A","B","B","B","B","C","C","C","C","D","D","D","D",
               "E","E","E","E","E","F","F","F","F","G","G","G","G","H","H","H","H",
               "I","I","I","I","J","K","K","L","L","L","L","M","M","M","M","N",
               "N","N","N","O","O","O","P","P","P","P","Q","R","R","R","S","S",
               "S","S","T","T","T","T","U","U","V","V","W","W","X","Y","Y","Z",
               "A","A","A","A","B","B","B","B","C","C","C","C","D","D","D","D",
               "E","E","E","E","E","F","F","F","F","G","G","G","G","H","H","H","H",
               "I","I","I","I","J","K","K","L","L","L","L","M","M","M","M","N",
               "N","N","N","O","O","O","P","P","P","P","Q","R","R","R","S","S",
               "S","S","T","T","T","T","U","U","V","V","W","W","Y","Y","Z",
               "A","A","A","A","B","B","B","B","C","C","C","C","D","D","D","D",
               "E","E","E","E","E","F","F","F","F","G","G","G","G","H","H","H","H",
               "I","I","I","I","J","L","L","L","L","M","M","M","M","N",
               "N","N","N","O","O","O","P","P","P","P","Q","R","R","R","S","S",
               "S","S","T","T","T","T","U","U","V","V","W","W","Y","Y","Z"]

    if self.select("let3").first == nil
      self.create(:let3 => @letterpool.sample(3).join,
                  :let4 => @letterpool.sample(4).join,
                  :let5 => @letterpool.sample(5).join,
                  :let6 => @letterpool.sample(6).join,
                  :let7 => @letterpool.sample(7).join)
      self.create(:let3 => @letterpool.sample(3).join,
                  :let4 => @letterpool.sample(4).join,
                  :let5 => @letterpool.sample(5).join,
                  :let6 => @letterpool.sample(6).join,
                  :let7 => @letterpool.sample(7).join)
    end
  end
end
