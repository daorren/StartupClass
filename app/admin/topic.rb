ActiveAdmin.register Topic do
  permit_params :title, :content
  menu priority: 1
  menu parent: "Society"

  filter :user, as: :check_boxes, collection: proc { User.all }
  filter :content_cont, as: :string, label: "Content"

  scope :all, default: true
  scope("In 3 Months") {|scope| scope.where(created_at: (Time.now - 3.month).in_time_zone..Time.now.in_time_zone)}

  config.sort_order = 'id_asc'
  config.per_page = 10

  index download_links: true
  index download_links: [:pdf, :csv]

  csv do
    column :title
    column(:author) { |topic| topic.user.email }
    column :content
  end

  index as: :table do
    id_column
    column :title
    column :content
    column :created_at
    column :updated_at
    actions
  end

  index as: :grid do |topic|
    link_to topic.title, admin_topic_path(topic)
  end

  index as: ActiveAdmin::Views::IndexAsTable do
    column :title
    actions
  end

  form do |f|
    inputs 'Head' do
      semantic_errors *f.object.errors.keys
      input :title
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    panel 'Markup' do
      "The following can be used in the content below..."
    end
    inputs 'Body', :content, :user
    para "Press cancel to return to the list without saving."
    actions
  end
end
