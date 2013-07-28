class ListController < ApplicationController
  def index

    @lists = List.all
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @lists.to_json(include: { items: { only: [:name, :done, :comment] } } )  }
    end

  end

  def show

    @list = List.find(params[:id])
    @items = @list.items
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @list.to_json(include: { items: { only: [:name, :done, :comment] } } )  }
    end
  end

  def destroy
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
