class Post < ActiveRecord::Base
  validates :title, presence: true
  validate  :is_clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  def is_clickbait
    title_nec = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title != nil
      click = title_nec.find do |tester|
        self.title.include?(tester) == true
      end
    end
    if click == nil
      errors.add(:title, "must be clickbait")
    end
  end

end
