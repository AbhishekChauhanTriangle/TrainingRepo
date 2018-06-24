class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    ##user ||= User.new # guest user (not logged in)
      if user.roleusers.first.roles_id == 1
        can :assign_subject, UserSubject
        can :assign_roles, Roleuser
        can :list, Book
        can :show, Book
        can :new, Book
        can :create, Book
        can :edit, Book
        can :update, Book
        can :delete, Book
        can :show_subjects, Subject
        can :add_assign_roles, Roleuser
        can :add_assign_subject, UserSubject
        can :viewAllForum, Forum
        can :viewUsers, Forum
        
      elsif user.roleusers.first.roles_id == 2
        cannot :assign_subject, UserSubject
        cannot :assign_roles, Roleuser
        can :list, Book
        can :show, Book
        can :new, Book
        can :create, Book
        can :edit, Book
        can :update, Book
        can :delete, Book
        can :show_subjects, Subject

      else
        cannot :assign_subject, UserSubject
        cannot :assign_roles, Roleuser
        can :list, Book
        can :show, Book
        can :new, Book
        can :create, Book
        can :edit, Book
        can :update, Book
        can :delete, Book
        can :show_subjects, Subject
      end
    
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
