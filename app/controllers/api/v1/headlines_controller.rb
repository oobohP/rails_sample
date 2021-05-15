class Api::V1::HeadlinesController < ApplicationController
  before_action :set_headline, only: %i[show update destroy]

  # GET /headlines/
  # Returns all records from Headlines
  def index
    @headlines = Headline.all
    render json: @headlines
  end

  # GET /headline/:id
  # Retrieves a single entry based on id given
  def show
    render json: @headline
  end

  # POST /headlines
  # Creates an entry in the db with given params
  def create
    xml = HTTParty.get('https://www.theverge.com/rss/index.xml').body
    feed = Feedjira.parse(xml)

    first_entry = feed.entries.first
    result = { title: first_entry.title,
               article_source: first_entry.url,
               published_date: first_entry.published }
    @headline = Headline.new(result)
    if @headline.save
      render json: @headline
    else
      render error: { error: 'Headline is still the same, duplicate article source' }, status: 400
    end
  end

  # PUT /headline/:id
  # Updates an entry in the db by id given
  def update
    if @headline
      @headline.update(headline_params)
      render json: { message: 'Headline successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update headline' }, status: 400
    end
  end

  # DELETE /headlines/:id
  # Deletes an entry in the db with id given
  def destroy
    if @headline
      @headline.destroy
      render json: { message: 'Headline successfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete Headline' }, status: 400
    end
  end

  private

  # Assuming this is the rails way to sanitize data w/ it's ORM
  def headline_params
    params.require(:headline).permit(:title, :article_source, :published_date)
  end

  # Finds param before running show, update, and destroy
  def set_headline
    @headline = Headline.find(params[:id])
  end
end
