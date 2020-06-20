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
#  board_id   :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#
class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    belongs_to :board
end
