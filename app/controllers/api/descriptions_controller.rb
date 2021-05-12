class Api::DescriptionsController<ApplicationController
    # def index
    #     descriptions = Description.all
    #     if params[:phone_id]
    #         phone = Phone.find_by(id: params[:phone_id])
    #         if phone.nil?
    #             render json: { message: phone.errors }, status: 400
    #         else
    #             descriptions = phone.descriptions
    #         end
    #       else
    #         descriptions = Description.all
    #       end
    # end
    def create
        description = Description.create(model_params)
        description.phone = Phone.find_or_create_by(phone_params)
        
        
    end
    # def edit
    #     description = Description.find(params[:id])
    # end
    # def update
    #     description = Description.find(params[:id])
    #     if description.save
    #         description.update(description_params)
    #     else
    #         render json: { message: description.errors }, status: 400
    #     end
    # end
    def show
            phone = Phone.find_by(id: params[:phone_id])
            description = phone.descriptions.find_by(id: params[:id])
            if description.nil?
                render json: { message: description.errors }, status: 400
            else
                description = Description.find(params[:id])
            end
        
    end
    private
        def description_params
            params.require(:description).permit(:content)
        end
        def phone_params
            params.require(:phone).permit(:name, :model, :price, :img_url)
        end
end