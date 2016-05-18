ActiveAdmin.register Comment, as: "OriginComment" do
  permit_params :content, :commentable_id, :commentable_type, :user_id

  index as: :table do
    id_column
    column :content
    column :commentable_type do |comment|
      link_to comment.commentable.title.truncate(23), "/admin/#{comment.commentable_type.pluralize.underscore}/#{comment.commentable_id}"
    end
    column :created_at do |comment|
      comment.created_at.strftime("%Y年%m月%d日 %H:%M")
    end
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Comment Details" do
      f.input :content
      f.input :commentable_type, as: :select, collection: [ClassVideo, Topic]
      # 因为没有HTML和JS，ajax的级联菜单想做没法做。当然还有其他ajax都不能做
      f.input :commentable_id
      f.input :user
    end
    f.actions
  end
end
