class JournalEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  # get /users/:user_id/journal_entries 
  def index 
    journal_entries = current_user.journal_entries
    render json: journal_entries
  end

  # get /users/:user_id/journal_entries/:id
  def show 
    journal_entry = user.journal_entries.find(params[:id])
    render json: journal_entry
  end 

  # post /users/:user_id/journal_entries
  def create
    journal_entry = current_user.journal_entries.new(journal_entry_params)
    if journal_entry.save 
      render json: journal_entry, status: :created
    else 
      render json: journal_entry.errors
    end
  end

  def update 
    journal_entry = current_user.journal_entries.find(params[:id])
    if journal_entry.update(journal_entry_params)
      render json: journal_entry
    else 
      render json: journal_entry.errors
    end
  end 

  # delete /users/:user_id/journal_entries/:id
  def destroy 
    journal_entry = current_user.journal_entries.find(params[:id])
    journal_entry.destroy
  end

  private

  def set_user
    user = User.find(params[:user_id])
  end

  def journal_entry_params
    params.require(:journal_entry).permit(:working_hours)
  end

end
