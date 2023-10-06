class Ability
  include CanCan::Ability

  def initialize(user)
    # Administrador
    if user.admin?
      puts 'soy admin'
      can :manage, Post
      can :manage, Comment
    else
      # Usuario
      puts 'soy user'
      can :read, :all
      can :create, Post, author_id: user.id
      can :create, Comment
      can :destroy, Comment, author_id: user.id
      can :destroy, Post, author_id: user.id
    end
  end
end
