class DecksController < ApplicationController


  def index
    decks = Deck.all
    render json: decks, except: [:created_at, :updated_at],
    include: {cards: {except: [:created_at, :updated_at] }}
  end

  def new
    deck = Deck.new
  end


  def show
    deck = Deck.find_by(id: params[:id])
    if deck
      render json: deck, except: [:created_at, :updated_at, :card_ids], include: {cards: {except: [:created_at, :updated_at] }}
    else
      render json: 'Error: The deck you are searching for does not exist.'
    end
  end


  def create
    deck = Deck.new(deck_params)
    if deck.save
      render json: deck
    else
      render json: deck.errors.full_messages, status: :unprocessable_entity
    end
  end


  # def update
  #   if @deck.update(deck_params)
  #     render json: @deck
  #   else
  #     render json: @deck.errors, status: :unprocessable_entity
  #   end
  # end


  def destroy
    deck = Deck.find(params[:id])
    deck.destroy
  end

  private

    def deck_params
      params.require(:deck).permit(:name)
    end
end
