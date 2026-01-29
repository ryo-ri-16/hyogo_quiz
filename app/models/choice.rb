class Choice < ApplicationRecord
  belongs_to :question

  validates :content, presence: true
  validates :position, uniqueness: { scope: :question_id }

  scope :correct, -> { where(is_correct: true) }
  scope :incorrect, -> { where(is_correct: false) }
  scope :ordered, -> { order(:position) }
end
