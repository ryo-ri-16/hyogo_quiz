class Question < ApplicationRecord
  mount_uploader :image, QuestionImageUploader

  belongs_to :category, optional: true
  has_many :choices, dependent: :destroy

  validates :title, presence: true
  validate :correct_is_one

  private

  def correct_is_one
    return if new_record? && choices.empty?

    return if choices.empty?

    if choices.select(&:is_correct).size != 1
      errors.add(:choices, "正解は1つである必要があります")
    end
  end
end
