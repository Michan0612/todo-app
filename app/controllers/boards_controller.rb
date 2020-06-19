class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :content, :eyecatch)
  end

end
