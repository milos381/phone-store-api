class Api::RatingsController<ApplicationController
    # def index
    #     ratings = Rating.all
    #     if params[:phone_id]
    #         phone = Phone.find_by(id: params[:phone_id])
    #         if phone.nil?
    #             render json: { message: phone.errors }, status: 400
    #         else
    #             descriptions = phone.descriptions
    #         end
    #       else
    #         ratings = Rating.all
    #       end
    # end
    def create
        rating = Rating.create(rating_params)
        rating.phone = Phone.find_or_create_by(phone_params)
        
        
    end
    # def edit
    #     rating = Rating.find(params[:id])
    # end
    # def update
    #     rating = Rating.find(params[:id])
    #     if rating.save
    #         rating.update(rating_params)
    #     else
    #         render json: { message: rating.errors }, status: 400
    #     end
    # end
    def show
            phone = Phone.find_by(id: params[:phone_id])
            rating = phone.ratings.find_by(id: params[:id])
            if rating.nil?
                render json: { message: rating.errors }, status: 400
            else
                rating = Rating.find(params[:id])
            end
        
    end
    private
        def rating_params
            params.require(:rating).permit(:number)
        end
        def phone_params
            params.require(:phone).permit(:name, :model, :price, :img_url)
        end
end