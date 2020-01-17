# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  resources :users, only: %i[update show]
  resources :teachers, only: %i[create show]
  resources :classrooms
  resources :students
  resources :enrollments
  resources :lessons
  resources :lesson_items, only: %i[create update]
end
