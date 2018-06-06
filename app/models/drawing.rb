class Drawing < ActiveRecord::Base
    validates_presence_of :title, :content, :theme
    
    belongs_to :user
    belongs_to :theme
end