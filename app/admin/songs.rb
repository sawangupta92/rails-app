ActiveAdmin.register Song do
  permit_params :title, :artist, :duration, :genre, :release_date

  index do
    selectable_column
    id_column
    column :title
    column :artist
    column :duration do |song|
      "#{song.duration} seconds"
    end
    column :genre
    column :release_date
    column :created_at
    actions
  end

  filter :title
  filter :artist
  filter :genre
  filter :release_date
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :artist
      f.input :duration, hint: "Duration in seconds"
      f.input :genre
      f.input :release_date, as: :date_picker
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :artist
      row :duration do |song|
        "#{song.duration} seconds"
      end
      row :genre
      row :release_date
      row :created_at
      row :updated_at
    end
  end
end
