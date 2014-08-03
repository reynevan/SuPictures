class Photo < ActiveRecord::Base
  has_attached_file :image
  
  def tagi
    self.tags.split(' ')
  end
end