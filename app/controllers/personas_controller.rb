class PersonasController < ApplicationController
	  # GET method to get all products from database   
  def index   
    @personas = Persona.order(:created_at)
    render json: @personas 
  end   
   
  # GET method to get a persona by id   
  def show   
    @persona = Persona.find(params[:id])
    render json: @persona
  end
   
  # GET method for the new persona form   
  def new   
    @persona = Persona.new   
  end   
   
  # POST method for processing form data   
  def create
  	@persona = Persona.new(create_params)
  	@persona.save
    if @persona.errors.empty?
      flash[:notice] = 'Persona added!'  
      render json: @persona 
    else   
      flash[:error] = 'Failed to edit persona!'
      render json: { errors: @persona.errors }, status: :forbiddden
      render :new
    end   
  end   
   
   # GET method for editing a persona based on id   
  def edit   
    @persona = Persona.find(params[:id])   
  end   
   
  # PUT method for updating in database a persona based on id   
  def update   
    @persona = Persona.find(params[:id]) 
    @persona.update(update_params) 
    if @persona.errors.empty?  
      flash[:notice] = 'Persona updated!'
      render json: @persona
    else   
      flash[:error] = 'Failed to edit persona!'
      render json: { errors: @persona.errors }, status: :forbiddden   
      render :edit   
    end   
  end   
   
  # DELETE method for deleting a persona from database based on id   
  def destroy   
    @persona = Persona.find(params[:id])   
    if @persona.delete   
      flash[:notice] = 'Persona deleted!'
      head :no_content
    else   
      flash[:error] = 'Failed to delete this persona!'   
      render :destroy   
    end   
  end   
   
  # we used strong parameters for the validation of params   
  def create_params   
    params.permit(:name, :pv, :pa)   
  end

  def update_params   
    params.permit(:name, :pv, :pa)   
  end   

end
