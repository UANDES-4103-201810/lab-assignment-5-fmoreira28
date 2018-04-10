Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/users", to: "users#create"
  get  "/users/:id", to: "users#show"
  put "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  post "/events", to: "events#create"
  get  "/events/:id", to: "events#show"
  put "/events/:id", to: "events#update"
  delete "/events/:id", to: "events#destroy"

  post "/places", to: "places#create"
  get  "/places/:id", to: "places#show"
  put "/places/:id", to: "places#update"
  delete "/places/:id", to: "places#destroy"

  post "/tickets", to: "tickets#create"
  get  "/tickets/:id", to: "tickets#show"
  put "/tickets/:id", to: "tickets#update"
  delete "/tickets/:id", to: "tickets#destroy"

  get "/users", to: "users#more_tickets_boughts"
  get "/places", to: "places#more_assistance"
  get "/events", to: "events#more_bought_less_paid"
  get "/tickets", to: "tickets#most_expensive"

end
