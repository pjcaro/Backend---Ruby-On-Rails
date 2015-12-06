class Post < ActiveRecord::Base
  belongs_to :usuario, dependent: :destroy
  has_many :attachments
  has_many :payments
  validates :titulo, presence: true, uniqueness: true
  before_save :valores_default
  include Picturable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller,model| controller.current_usuario }

  def valores_default
  	self.costo ||= 0
  end

end
