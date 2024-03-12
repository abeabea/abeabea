class BallsController < ApplicationController
   
  before_action :authenticate_user!, only: [:new, :create]

 
  def index
    if params[:search] != nil && params[:search] != ''
      search = params[:search]
      @balls = Ball.joins(:user).where("rule LIKE ? OR genre LIKE ?", "%#{search}%", "%#{search}%")
    else
      @balls = Ball.all
    end
     
  end

    def new
        @ball = Ball.new
    end
    
      def create
        ball = Ball.new(ball_params)
        ball.user_id = current_user.id 
        if ball.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @ball = Ball.find(params[:id])
        @comments = @ball.comments
        @comment = Comment.new
      end

      def edit
        @Ball = Ball.find(params[:id])
      end
    
      def update
        ball = Ball.find(params[:id])
        if ball.update(ball_params)
          redirect_to :action => "show", :id => ball.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        ball = Ball.find(params[:id])
        ball.destroy
        redirect_to action: :index
      end

      def position
        if params[:search] != nil && params[:search] != ''
          search = params[:search]
          @balls = Ball.joins(:user).where("rule LIKE ? OR genre LIKE ?", "%#{search}%", "%#{search}%")
        else
          @balls = Ball.all
        end
      end


      private
      def ball_params
        params.require(:ball).permit(:rule, :genre, :about)
      end

end