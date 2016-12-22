class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /boards
  # GET /boards.json

  $value = 0
  def index
    @boards = Board.where(user_id: current_user)
  end

  def board_selection
    @photo_id = params[:image_id]
    $value = @photo_id
    @boards = Board.where(user_id: current_user)
    @category = Category.new
  end

  def update_boards
    selected_board_id = params[:board_id]
    cat = Category.create(board_id: selected_board_id, image_id: $value)
    if cat
      redirect_to images_path, :flash => { :success => "Success." }
   else
      redirect_to images_path, :flash => { :error => "Error closing message." }
   end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
    @board.user_id = current_user.id
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id

    respond_to do |format|
      if @board.save
        format.html { redirect_to user_board_path(current_user.id, @board), notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to user_board_path(current_user.id, @board), notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to user_boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name, :user_id, :board_id, :image_id)
    end
end
