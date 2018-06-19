require 'elasticsearch/model'

class Book < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  attr_accessible :subject_id, :title, :price, :description, :created_at

  # Need to Index this Model using Console - ctrl + c -> Book.import force: true
  # http://localhost:9200/  - ELasticSearch

  def self.es_search(query)
  __elasticsearch__.search(
    {
      query: {
        regexp: {
         title: ".*"+query+".*" 
       }
      },
      highlight: {
        fields: {
          title: {}
        }
      }
    }
  )
end


  TITLE_OPTIONS = %w(MathematicsBook PhysicsBook ChemistryBook PsycologyBook EnglishBook MathematicsBook1 PhysicsBook1 ChemistryBook1 PsycologyBook1 EnglishBook1 MathematicsBook2 PhysicsBook2 ChemistryBook2 PsycologyBook2 EnglishBook2 MathematicsBook3 PhysicsBook3 ChemistryBook3 PsycologyBook3 EnglishBook3 MathematicsBook4 PhysicsBook4 ChemistryBook4 PsycologyBook4 EnglishBook4)
  belongs_to :subject
  belongs_to :user
  validates :title, :presence => true, :length => {:minimum => 5}, :inclusion => {:in => TITLE_OPTIONS}
  validates_numericality_of :price, :message => "Error Message"

  
end