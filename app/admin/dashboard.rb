ActiveAdmin.register_page "Dashboard" do

  menu priority: 0, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent Topics" do
          ul do
            Topic.order('id_desc').limit(5).map do |topic|
              li link_to(topic.title, admin_topic_path(topic))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to StartupAdmin."
        end
      end
    end
  end # content
end
