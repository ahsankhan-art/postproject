class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.created_by=current_user.id.to_s
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render posts_url, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.created_by==current_user.id.to_s
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
    else
      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Only User who created the post can delete this." }
        format.json { head :no_content }
    end
  end
  end

  def mypost
    @posts = Post.all
  end
  
 

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
    if(@post.created_by!=current_user.id.to_s)
      respond_to do |format|
      format.html { redirect_to posts_url, notice: "What are you doing here?." }
    end
  end
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:post, :created_by, :description,:likes,:liked_by,:dislike,:disliked_by)
  end
  
end
