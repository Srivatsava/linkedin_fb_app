class Authentication < ActiveRecord::Base
  belongs_to :user
  def self.create(auth)
    create! do |authentication|
      authentication.provider = auth["provider"]
      authentication.uid = auth["uid"]
    end
  end
end
