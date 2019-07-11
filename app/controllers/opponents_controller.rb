class OpponentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # GET method to get all products from database
  def index
    @opponent = Opponent.all
    render json: @opponent
  end

  # GET method to get a opponent by id
  def show
    @opponent = Opponent.find(params[:id])
    render json: @opponent
  end

  # GET method for the new opponent form
  def new
    @opponent = Opponent.new
  end

  # POST method for processing form data
  def create
    av = rand(21..31)
    @opponent = Opponent.new(name: Faker::JapaneseMedia::DragonBall.character, pv: 100, pa: 100, avatarnum: av)
    @opponent.save
    if @opponent.errors.empty?
      render :index
    else
      # render json: { errors: @opponent.errors }, status: :forbiddden
      render :new
    end
  end

  # GET method for editing a opponent based on id
  def edit
    @opponent = Opponent.find(params[:id])
  end

  # PUT method for updating in database a opponent based on id
  def update
    @opponent = Opponent.find(params[:id])
    @opponent.update(update_params)
    if @persona.errors.empty?
      flash[:notice] = 'Persona updated!'
    else
      flash[:error] = 'Failed to edit opponent!'

      render :edit
    end
  end

  # DELETE method for deleting a opponopponentent from database based on id
  def destroy
    @opponent = Opponent.find(params[:id])
    if @opponent.delete
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

  def choose_action
    choice = rand(1..3)
    if choice == 1
      redirect_to action: 'ia_attaque_cool'
    elsif choice == 2
      redirect_to action: 'ia_attaque_medium'
    else
      redirect_to action: 'ia_attaque_hard'
    end
  end

  def ia_attaque_cool
    unless Opponent.last.pv.zero?
      pa = Opponent.last.pa
      pv = Persona.last.pv

      if Opponent.last.pa < 90
        Opponent.update(Opponent.last.id, pa: pa + 10 )
      else
        Opponent.update(Opponent.last.id, pa: 100 )
      end

      if Persona.last.pv > Opponent.last.pa / 30
        Persona.update(Persona.last.id, pv: pv - Opponent.last.pa / 30 )
      else
        Persona.update(Persona.last.id, pv: 0 )
      end
    end
    redirect_to controller: 'personas', action: 'index'
  end

  def ia_attaque_medium
    unless Opponent.last.pv.zero?
      pa = Opponent.last.pa
      pv = Persona.last.pv

      if Opponent.last.pa > 5
        Opponent.update(Opponent.last.id, pa: pa - 5 )
      else
        Opponent.update(Opponent.last.id, pa: 0 )
      end

      if Persona.last.pv > Opponent.last.pa / 10
        Persona.update(Persona.last.id, pv: pv - Opponent.last.pa / 10 )
      else
        Persona.update(Persona.last.id, pv: 0 )
      end
    end
    redirect_to controller: 'personas', action: 'index'
  end

  def ia_attaque_hard
    unless Opponent.last.pv.zero?
      pa = Persona.last.pa
      pv = Opponent.last.pv

      if Opponent.last.pa > 10
        Opponent.update(Opponent.last.id, pa: pa - 10 )
      else
        Opponent.update(Opponent.last.id, pa: 0 )
      end

      if Persona.last.pv > Opponent.last.pa / 5
        Persona.update(Persona.last.id, pv: pv - Opponent.last.pa / 5 )
      else
        Persona.update(Persona.last.id, pv: 0 )
      end
    end
    redirect_to controller: 'personas', action: 'index'
  end
end
