Libra::Application.routes.draw do
  
  require 'sidekiq/web'     # Used for Web part of Sidekiq
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users

  get  'book/list'
  get  'book/new'
  post 'book/create'
  put  'book/update'
  get  'book/show'
  get  'book/edit'
  get  'book/delete'
  get  'book/update'
  get  'book/show_subjects'
  get  'book/destroy_user'
  get  'book/assign_subject'
  post 'book/add_assign_subject'
  get  'book/assign_roles'
  post 'book/add_assign_roles'
  get  'book/sendMail'
  #get  'book/search'

  get 'dailyTask/sayHello'
  get 'dailyTask/loopOne'
  get 'dailyTask/loopTwo'
  get 'dailyTask/loopThree'
  get 'dailyTask/useIfNextIterators'
  get 'dailyTask/useReturnStepMapInPlace'
  get 'dailyTask/usingSet'
  get 'dailyTask/funcCallFromDifferentClass'
  get 'dailyTask/openSwitchFile'
  post '/dailyTask/usingSwitchCase'
  get 'dailyTask/iteratorSelectRejectCollectInject'
  get 'dailyTask/usingModules'
  get 'dailyTask/usingMixins'
  
  root :to => 'book#list'
  get "search", to: "search#search"


  get 'forum/index'
  get 'forum/assign'
  get 'forum/viewAllForum'
  get 'forum/viewUsers'

  get 'polymorphic/viewTeacherPerCourse'
  post 'polymorphic/assignTeacherPerCourse'
  get 'polymorphic/viewTeacherPerLab'
  post 'polymorphic/AssignTeacherPerLab'

  get 'join/index'
  get 'include/index'

end
