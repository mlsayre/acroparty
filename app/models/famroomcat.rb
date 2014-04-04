class Famroomcat < ActiveRecord::Base
  attr_accessible :r10cat, :r1cat, :r2cat, :r3cat, :r4cat, :r5cat, :r6cat, :r7cat, :r8cat, :r9cat

  def self.createcats
    @randomcategory = ["General", "Sports", "Food", "Movies", "Television", "History",
                      "Music", "Art", "Animals", "Science", "Government", "Fashion",
                      "Books", "Travel", "Celebrities", "Romance", "Technology",
                      "Family", "School", "Nature", "Health", "Humor", "Current Events",
                      "General", "General", "Work", "Give Some Advice", "Definitions"]

    if self.select("r1cat").first == nil
      self.create(:r1cat => @randomcategory.sample,
                  :r2cat => @randomcategory.sample,
                  :r3cat => @randomcategory.sample,
                  :r4cat => @randomcategory.sample,
                  :r5cat => @randomcategory.sample,
                  :r6cat => @randomcategory.sample,
                  :r7cat => @randomcategory.sample,
                  :r8cat => @randomcategory.sample,
                  :r9cat => @randomcategory.sample,
                  :r10cat => @randomcategory.sample)
    end
  end
end
