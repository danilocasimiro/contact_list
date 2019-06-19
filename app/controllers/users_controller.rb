class UsersController < ApplicationController

    before_action :require_logger_in_user, only: [:edit, :update]
    
    def new
        @user = User.new
    end
    
    
    def create
        @user = User.create(user_params)
    
        if @user.save
            flash[:success] = 'Cadastro realizado com sucesso'
            redirect_to root_url
        else
        render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if current_user.update(user_params)
            flash[:success] = 'Dados atualizados'
            redirect_to contacts_url
        else
            render 'edit'
        end
    end
    
    private
    
    # feito para evitar que alguem insira algo nos parametros
    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
    
end
