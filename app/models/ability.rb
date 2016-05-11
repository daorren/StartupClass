class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    user ||= User.new

    # 其实下面的这种默认写法，不支持一个人有多个角色的情况
    # if user.has_role? :video_admin
    #   can :manage, ClassVideo
    #   # can :read, Topic
    # elsif user.has_role? :community_admin
    #   can :manage, Topic
    #   can :manage, Comment
    # else
    #   can :read, :all
    # end
    if user.has_role? :video_admin
      can :manage, ClassVideo
    else
      can :read, :all
    end

    if user.has_role? :community_admin
      can :manage, Topic
      can :manage, Comment
    end
  end
end
