class PersonasController < ApplicationController
  skip_before_action :verify_authenticity_token
  # GET method to get all products from database
  def index
    if Persona.last.pv.zero?
      render :loose
    end
    if Opponent.last.pv.zero?
      render :win
    end
    @personas = Persona.all
  end

  def index2
    if Persona.last.pv.zero?
      render :loose
    end
    if Opponent.last.pv.zero?
      render :win
    end
    @personas = Persona.all
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
    av = rand(11..16)
    @persona = Persona.new(name: Faker::JapaneseMedia::OnePiece.character, pv: 100, pa: 100, avatarnum: av )
    @persona.save
    if @persona.errors.empty?
      render :index
    else
      render json: { errors: @persona.errors }, status: :forbiddden
      # render :new
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
    @persona.save
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
      render :index
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

  def attaque; end

  def you_attaque_cool
    unless Persona.last.pv.zero?
      pa = Persona.last.pa
      pv = Opponent.last.pv

      if Persona.last.pa < 90
        Persona.update(Persona.last.id, pa: pa + 10 )
      else
        Persona.update(Persona.last.id, pa: 100 )
      end

      if Opponent.last.pv > 3
        Opponent.update(Opponent.last.id, pv: pv - Persona.last.pa / 30 )
      else
        Opponent.update(Opponent.last.id, pv: 0 )
      end
    end
    render :index2
  end

  def you_attaque_medium
    unless Persona.last.pv.zero?
      pa = Persona.last.pa
      pv = Opponent.last.pv

      if Persona.last.pa > 5
        Persona.update(Persona.last.id, pa: pa - 5 )
      else
        Persona.update(Persona.last.id, pa: 0 )
      end

      if Opponent.last.pv > 10
        Opponent.update(Opponent.last.id, pv: pv - Persona.last.pa / 10 )
      else
        Opponent.update(Opponent.last.id, pv: 0 )
      end
    end
    render :index2
  end

  def you_attaque_hard
    unless Persona.last.pv.zero?
      pa = Persona.last.pa
      pv = Opponent.last.pv
      if Persona.last.pa > 10
        Persona.update(Persona.last.id, pa: pa - 10 )
      else
        Persona.update(Persona.last.id, pa: 0 )
      end

      if Opponent.last.pv > 20
        Opponent.update(Opponent.last.id, pv: pv - Persona.last.pa / 5 )
      else
        Opponent.update(Opponent.last.id, pv: 0 )
      end
    end
    render :index2
  end

  def win; end

  def loose; end
end