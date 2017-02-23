class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  # GET /cocktails
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1
  def show
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # GET /cocktails/1/edit
  def edit
  end

  # POST /cocktails
  def create
    @cocktail = Cocktail.new(cocktail_params)
      if @cocktail.save
        redirect_to @cocktail, notice: 'Cocktail was successfully created.'

      else
        render :new
      end
  end

  # PATCH/PUT /cocktails/1
  def update
      if @cocktail.update(cocktail_params)
        redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /cocktails/1
  def destroy
    @cocktail.destroy
    redirect_to cocktails_path, notice: 'Cocktail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :ingredients)
    end
end
