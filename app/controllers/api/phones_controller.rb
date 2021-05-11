class Api::PhonesController<ApplicationController
    before_action :set_surfboard, only: [:show, :update, :destroy]
    def index
        render json: Phone.all
    end
    def create
        phone = Phone.new(phone_params)
        if phone.save
            render json: phone
        else
            render json: {message: phone.errors}, status: 400   
        end
    end
    def show
        render json: @phone
    end
    def update
        
    end
    private
    def set_phone
        @phone = Phone.find_by(id: params[:id])
    end
    def phone_params
        params.require(:phone).permit(:name, :model, :price, :img_url)
    end
end