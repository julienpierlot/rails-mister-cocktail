class DosesController < ApplicationController

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      flash[:notice] = "Ingredient has been added"
      redirect_to cocktail_path(@dose.cocktail)
    else
      @cocktail = @dose.cocktail
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
