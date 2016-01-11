class StudiosController < ApplicationController
  def index
    @studios = Studio.all.sort_by do |studio| 
      studio.name
    end
  end

  def show
    @studio = Studio.find(params[:id])
  end
end
