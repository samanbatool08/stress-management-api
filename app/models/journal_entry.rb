class JournalEntry < ApplicationRecord
  belongs_to :user, optional: true 
end
