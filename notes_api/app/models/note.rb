class Note < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, :content, presence: true

  def self.save_all(notes_params)
    transaction do
      notes_params.each do |params|
        Note.create!(params)
      end
    end
    true
  end
end
