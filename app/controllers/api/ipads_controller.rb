
class Api::IpadsController<ApplicationController
    
    def index
        render json: Ipad.all
    end
    def create
        
        ipad = Ipad.new(ipad_params)
        if ipad.save
            render json: ipad
        else
            render json: {message: ipad.errors}, status: 400   
        end
    end
    def show
        ipad = Ipad.find_by(id: params[:id])
        render json: ipad
    end
    def update
        ipad = Ipad.find_by(id: params[:id])
        if ipad.update(ipad_params)
          render json: ipad
        else 
          render json: { message: ipad.errors }, status: 400
        end
    end
    
    def destroy 
        ipad = Ipad.find_by(id: params[:id])
        if ipad.destroy
          render json: ipad, status: :ok

        else 
          render json: { message: "Unable to delete this ipad" }, status: 400
        end 
    end
    private

    def ipad_params
        params.require(:ipad).permit(:make, :model, :price, :img_url)
    end
end