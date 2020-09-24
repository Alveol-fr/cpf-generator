Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'generator#new'
  post 'submit', to: 'generator#submit'

  # Dev : uncomment this route if you want to have a preview of the generate document on /attestation
  # get  'attestation', to: 'generator#attestation_inscription'
end
