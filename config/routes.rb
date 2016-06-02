Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :items, except:[:new, :edit] do
        collection do
          get "/find", to: "items#find"
          get "/find_all", to: "items#find_all"
          get "/random", to: "items#random"
          scope module: "items" do
            get "/most_revenue", to: "most_revenue#index"
            get "/most_items", to: "most_items#index"
          end
        end
        scope module: "items" do
          member do
            get "/invoice_items", to: "invoice_items#index"
            get "/merchant", to: "merchants#show"
          end
        end
      end

      resources :merchants, except:[:new, :edit] do
        collection do
          get "/find", to: "merchants#find"
          get "/find_all", to: "merchants#find_all"
          get "/random", to: "merchants#random"
          scope module: "merchants" do
            get "/most_revenue", to: "most_revenue#index"
            get "/most_items", to: "most_items#index"
          end
        end
          scope module: "merchants" do
            member do
              get "/items", to: "items#index"
              get "/invoices", to: "invoices#index"
              get "/revenue", to: "revenue#show"
              get "/favorite_customer", to: "favorite_customer#show"
          end
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get "/find", to: "customers#find"
          get "/find_all", to: "customers#find_all"
          get "/random", to: "customers#random"
        end
        scope module: "customers" do
          member do
            get "/invoices", to: "invoices#index"
            get "/transactions", to: "transactions#index"
            get "/favorite_merchant", to: "favorite_merchant#show"
          end
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get "/find", to: "invoices#find"
          get "/find_all", to: "invoices#find_all"
          get "/random", to: "invoices#random"
        end
        scope module: "invoices" do
          member do
            get "/transactions", to: "transactions#index"
            get "/invoice_items", to: "invoice_items#index"
            get "/items", to: "items#index"
            get "/customer", to: "customers#show"
            get "/merchant", to: "merchants#show"
          end
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get "/find", to: "transactions#find"
          get "/find_all", to: "transactions#find_all"
          get "/random", to: "transactions#random"
        end
        scope module: "transactions" do
          member do
            get "/invoice", to: "invoices#show"
          end
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get "/find", to: "invoice_items#find"
          get "/find_all", to: "invoice_items#find_all"
          get "/random", to: "invoice_items#random"
        end
        scope module: "invoice_items" do
          member do
            get "/invoice", to: "invoices#show"
            get "/item", to: "items#show"
          end
        end
      end
    end
  end
end
