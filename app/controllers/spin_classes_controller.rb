class SpinClassesController < ApplicationController
  def show
    @spin_class = SpinClass.find(params[:id])
  end
end
