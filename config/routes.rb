# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :companies, only: %i[index show create] do
      resources :employees, only: %i[index create destroy]
    end

    resources :employees do
      resources :managees, only: :index
    end
  end
end
