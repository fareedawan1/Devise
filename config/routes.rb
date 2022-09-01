# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
