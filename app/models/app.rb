class App < Doorkeeper::Application
  validates :description, :link, presence: true
end
