class Collaborator < ActiveRecord::Base
    belongs_to :wiki
    has_many :users
end
