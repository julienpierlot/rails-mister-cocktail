class PagesController < ApplicationController

  def search
    @cocktails = Cocktail.where('name LIKE ?', params[:keywords])
  end

end
