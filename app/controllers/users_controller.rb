class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end
  
    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'Usuário foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, alert: "Acesso negado."
    end
  end

end
