#app/controllers/users_controller.rb
#class AdminsController < ApplicationController
  #  
  #  def index#
        @admins = Admin.all
           if @admins
              render json: {
              admins: @admins
           }
          else
              render json: {
              status: 500,
              errors: ['no admins found']
          }
         end
  #  end
#def show
  #     @admin = Admin.find(params[:id])
  #         if @admin
  #            render json: {
  #            admin: @admin
  #         }
  #         else
  #            render json: {
  #            status: 500,
  #            errors: ['admin not found']
  #          }
  #         end
  #    end
  #    
  #    def create
  #       @admin = Admin.new(admin_params)
  #           if @admin.save
  #               login!  
  #               render json: {
  #               status: :created,
  #               admin: @admin
  #           }
  #          else 
  #              render json: {
  #              status: 500,
  #              errors: @admin.errors.full_messages
  #          }
  #          end
  #    end
#private
   #   
  #   def admin_params
  #       params.require(:admin).permit(:username, :password, :password_confirmation)
  #   end
#end