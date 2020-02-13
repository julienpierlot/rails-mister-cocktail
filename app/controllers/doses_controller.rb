class DosesController < ApplicationController

  def index
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      flash[:success] = "Ingredient has been added"
      redirect_to cocktail_path(@dose.cocktail)
    else
      flash[:alert] = "The ingredient is already present."
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      flash[:notice] = "The ingredient was removed"
      redirect_to cocktail_path(@dose.cocktail)
    else
      flash[:notice] = "Sorry there was a problem"
      redirect_to cocktail_path(@dose.cocktail)
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
