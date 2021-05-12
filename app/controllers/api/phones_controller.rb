class Api::PhonesController<ApplicationController
    before_action :set_surfboard, only: [:show, :update, :destroy]
    def index
        render json: Phone.all
    end
    def create
        phone = Phone.new(phone_params)
        description = phone.description.new(description_params)
        rating = phone.rating.new(rating_params)
        if phone.save
            render json: phone
        else
            render json: {message: phone.errors}, status: 400   
        end
    end
    def show
        render json: phone
        render json: description
        render json: rating
    end
    def update 
        if phone.update(phone_params)
          render json: phone
        else 
          render json: { message: phone.errors }, status: 400
        end
    end
    
    def destroy 
        if phone.destroy
          render status: 204
        else 
          render json: { message: "Unable to delete this phone" }, status: 400
        end 
    end
    private
    def set_phone
        phone = Phone.find_by(id: params[:id])
    end
    def phone_params
        params.require(:phone).permit(:name, :model, :price, :img_url)
    end
    def description_params
        params.require(:description).permit(:content)
    end
    def rating_params
        params.require(:rating).permit(:number)
    end
end