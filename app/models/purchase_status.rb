class PurchaseStatus < ApplicationRecord

    self.data = [
      { id: 1, name: '完売' }
    ]

  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  belongs_to :user
  belongs_to :item

end