
class Api::MacbooksController<ApplicationController
    
    def index
        render json: Macbook.all
    end
    def create
        
        macbook = Macbook.new(macbook_params)
        if macbook.save
            render json: macbook
        else
            render json: {message: macbook.errors}, status: 400   
        end
    end
    def show
        macbook = Macbook.find_by(id: params[:id])
        render json: macbook
    end
    def update
        macbook = Macbook.find_by(id: params[:id])
        if macbook.update(macbook_params)
          render json: macbook
        else 
          render json: { message: macbook.errors }, status: 400
        end
    end
    
    def destroy 
        macbook = Macbook.find_by(id: params[:id])
        if macbook.destroy
          render json: macbook, status: :ok

        else 
          render json: { message: "Unable to delete this macbook" }, status: 400
        end 
    end
    private

    def macbook_params
        params.require(:macbook).permit(:make, :model, :price, :img_url)
    end
end