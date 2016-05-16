class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :topics, dependent: :destroy

  SETTINGS = ['account', 'password', 'profile', 'notifications']

  # 以下这三个方法，就把角色定义清楚了。user.roles是个array。
  # 设计非常巧妙，根本不需要知道roles_mask哪个数字对应什么，只需要知道有没有这个角色，且mask数字不重复即可
  ROLES = [:video_admin, :community_admin]

  def roles=(roles)
   roles = [*roles].map { |r| r.to_sym }
   self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+) # 3**2 == 9, **是幂。array#&，取两者重合
  end

  def roles
   ROLES.reject do |r|
     ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero? # 3 & 2 => 2, 0 & 2 => 0
   end
  end

  def has_role?(role)
   roles.include?(role)
  end
end
