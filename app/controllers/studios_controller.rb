class StudiosController < ApplicationController
  def index
    @studios = Studio.all.sort_by do |studio| 
      studio.name
    end
  end

  def show
    @studio = Studio.find(params[:id])
    @studio.get_classes
    @studiosClasses = SpinClass.where(strict_date: Date.today .. Date.today + 10.days, studio_id: @studio.id)
  end

  def select_day_of_classes
    @classes = params[:selected_classes].map do |string| 
      SpinClass.find(string.to_i)
    end
    @class_strings = @classes.map do |spin_class|
      render_to_string(partial: "studios/selected_class", locals: {spin_class: spin_class})
    end

    @selected_day = @classes.first.month_and_day
    render json: {selected_classes: @class_strings, selected_day: "<h2 class='align-top'> #{@selected_day} </h2>"}
  end

end
