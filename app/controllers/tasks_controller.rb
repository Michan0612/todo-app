class TasksController < ApplicationController
		before_action :set_article, only: %i[show]

		def show

		end		

		def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end
  
    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        if @task.save
            redirect_to board_path(board), notice: 'コメントを追加'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end

    private
    def task_params
        params.require(:task).permit(:content, :title)
		end

		def set_article
			@task = Task.find(params[:id])
		end
		
end