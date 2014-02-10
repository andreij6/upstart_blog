class Blog < ActiveRecord::Base
  
  validates :title, length: { in: 3..20 }, presence: true
  
  validates :post, length: { minimum: 20 }, presence: true
  
end
