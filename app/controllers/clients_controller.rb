class ClientsController < ApiController
  # before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.select('id, first_name, last_name').all
    render json: @clients
  end

  # GET /clients/1
  def show
    @client = Client.find(params[:id])
    render json: @client.to_json(:include => {:jobs => { :only => [:id, :status, :job_type] }})
  end

  # # POST /clients
  # def create
  #   @client = Client.new(client_params)

  #   if @client.save
  #     render json: @client, status: :created, location: @client
  #   else
  #     render json: @client.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /clients/1
  # def update
  #   if @client.update(client_params)
  #     render json: @client
  #   else
  #     render json: @client.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /clients/1
  # def destroy
  #   @client.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_client
  #     @client = Client.find(params[:id])
  #   end

  #   # Only allow a trusted parameter "white list" through.
  #   def client_params
  #     params.require(:client).permit(:first_name, :last_name, :tax_id, :email, :entity)
  #   end
end
