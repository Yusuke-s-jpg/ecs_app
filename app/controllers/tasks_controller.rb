class TasksController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  # GET /posts
  # GET /posts.json
  def index
    @tasks = Task.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @tasks = Task.find(params[:id])
  end

  # GET /posts/new
  def new
    @task = Task.new
  end

  # GET /posts/1/edit
  def edit
    @tasks = Task.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @task = Task.new(task_params.merge(user_id: @current_user.id))

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: '投稿しました' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: '編集しました' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: '投稿を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :content, :image)
    end
end
