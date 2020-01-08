Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  resources :users, only: [:create, :show]
  resources :classrooms
  resources :students
  resources :enrollments
  resources :lessons
  resources :lesson_items, only: [:create, :update]
end
