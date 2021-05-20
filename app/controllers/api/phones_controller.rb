
class Api::PhonesController<ApplicationController
    
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
        phone = Phone.find_by(id: params[:id])
        render json: phone
    end
    def update
        phone = Phone.find_by(id: params[:id])
        if phone.update(phone_params)
          render json: phone
        else 
          render json: { message: phone.errors }, status: 400
        end
    end
    
    def destroy 
        phone = Phone.find_by(id: params[:id])
        if phone.destroy
          render json: phone, status: :ok

        else 
          render json: { message: "Unable to delete this phone" }, status: 400
        end 
    end
    private

    def phone_params
        params.require(:phone).permit(:make, :model, :price, :img_url)
    end
end