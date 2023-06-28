class Note < ApplicationRecord
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
