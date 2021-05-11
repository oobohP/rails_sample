class Api::V1::HeadlinesController < ApplicationController
  # Can be refactored to replace .find in private func and add before_action(show, update, destroy funcs)

  # GET /headlines/
  # Returns all records from Headlines
  def index
    @headlines = Headline.all
    render json: @headlines
  end

  # GET /headline/:id
  # Retrieves a single entry based on id given
  def show
    @headline = Headline.find(params[:id])
    render json: @headline
  end

  # POST /headlines
  # Creates an entry in the db with given params
  def create
    @headline = Headline.new(headline_params)
    if @headline.save
      render json: @headline
    else
      render error: { error: 'Unable to create record with' }, status: 400
    end
  end

  # PUT /headline/:id
  # Updates an entry in the db by id given
  def update
    @headline = Headline.find(params[:id])
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
    @headline = Headline.find(params[:id])
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
end
