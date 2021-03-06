# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  end_on     :date
#  start_on   :date
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
class Task < ApplicationRecord
    has_one_attached :eyecatch

    validates :title, presence: true
    validates :content, presence: true

    has_many :comments, dependent: :destroy

    belongs_to :user
    belongs_to :board
end
