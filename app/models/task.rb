class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  enum priority: {低: 0, 中: 1, 高: 2}

  scope :search_task_name_status, -> (search_task_name, search_status){
    where("task_name LIKE ?", "%#{search_task_name}%")
    .where(status: search_status)
    .order(created_at: "DESC")
  }

  scope :search_task_name, -> (search_task_name){
    where("task_name LIKE ?", "%#{search_task_name}%")
    .order(created_at: "DESC")
  }

  scope :search_status, -> (search_status){
    where(status: search_status)
    .order(created_at: "DESC")
  }
  belongs_to :user
end
