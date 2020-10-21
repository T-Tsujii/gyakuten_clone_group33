ActiveAdmin.register Movie do
  permit_params :name, :title, :url
end
