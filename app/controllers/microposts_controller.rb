class MicropostsController < ApplicationController
  def index
    @micropost = Micropost.new
  end

  def show
  end

  def create
    # @micropost = Micropost.new(micropost_params)
    # if @micropost.content.nil?
    #   @micropost.content = "なんか入力しろよ！！"
    #   @micropost.save
    #   redirect_to @micropost
    # elsif
    # end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
