class Lesson < ApplicationRecord
  scope :not_draft, -> { where(draft: false) }
  scope :sort_lessons, -> { order(priority: :asc) }

  belongs_to :course
  has_many :homeworks, dependent: :destroy

  validates :title, presence: true, length: { minimum: 7 }

  mount_uploader :image, LessonImageUploader
  mount_uploader :video, VideoUploader
end