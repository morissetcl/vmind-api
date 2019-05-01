# frozen_string_literal: true

ActiveAdmin.register Verse do
  permit_params :need, :theme, :name, :content

  form do |f|
    f.inputs do
      f.input :need, as: :select, collection: %w[Love Forgiveness Faith Health Praises Courage]
      f.input :theme
      f.input :name
      f.input :content
    end
    f.actions
  end
end
