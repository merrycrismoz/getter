class CardsController < ApplicationController

  def index
    cards = Card.all
    render json: cards, except: [:created_at, :updated_at]
  end

  def new
    card = Card.new
  end

  def show
    card = Card.find_by(id: params[:id])
      if card
        render json: card, except: [:created_at, :updated_at]
      else
        render json: "Error: The card you are searching for does not exist."
      end
  end

  def create
    card = Card.create(card_params)
    if card.save
      render json: card
    else
      render json: card.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
      card = Card.find(params[:id])
    end

  def update
    card = Card.find(params[:id])
      if card.update(card_params)
        render json: card
      else
        render json: card.errors, status: :unprocessable_entity
      end
  end

  def destroy
      card = Card.find(params[:id])
      card.destroy
    end

  private

    def card_params
      params.require(:card).permit(:title, :content, :deck_id)
    end
end
