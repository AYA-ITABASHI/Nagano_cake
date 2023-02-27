class Item < ApplicationRecord
    has_many_attached :images

  # def get_image
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end
end
