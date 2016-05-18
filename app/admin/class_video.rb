ActiveAdmin.register ClassVideo do
  permit_params :title, :speakers, :cover_image, :play_count, :video, :description
  menu priority: 1
  menu parent: "Study"


end
