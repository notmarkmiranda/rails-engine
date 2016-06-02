Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :items, except:[:new, :edit] do
        collection do
          get "/find", to: "items#find"
          get "/find_all", to: "items#find_all"
          get "/random", to: "items#random"
        end
      end

      resources :merchants, except:[:new, :edit] do
        collection do
          get "/find", to: "merchants#find"
          get "/find_all", to: "merchants#find_all"
          get "/random", to: "merchants#random"
        end
        scope module: "merchants" do
          member do
            get "/items", to: "items#index"
            get "/invoices", to: "invoices#index"
          end
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get "/find", to: "customers#find"
          get "/find_all", to: "customers#find_all"
          get "/random", to: "customers#random"
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
