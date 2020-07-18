class TasksController < ApplicationController
	before_action :set_article, only: %i[show]

	def index
		@tasks = Task.all
	end

	def show
		@board = Board.find(params[:board_id])
		@comments = @task.comments
	end		

	def new
		@task = current_user.tasks.build
		@task.user = current_user
    end
  
	def create
		@task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to task_path, notice: 'コメントを追加'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
	end

	def edit
		board = Board.find(params[:board_id]) 
		@task = current_user.tasks.find(params[:id])
	end
	
	def update
		@task = current_user.tasks.find(params[:id])
		if @task.update(task_params)
			redirect_to board_task_path(@task), notice: '更新できました'
		else
			flash.now[:error] = '更新できませんでした'
			render :edit
		end
	end

	def destroy
		task = current_user.tasks.find(params[:id])
		task.destroy!
		redirect_to board_path(board), notice: '削除に成功しました'
	end
		

    private
    def task_params
        params.require(:task).permit(:title, :content, :eyecatch)
	end

	def set_article
		@task = Task.find(params[:id])
	end

end