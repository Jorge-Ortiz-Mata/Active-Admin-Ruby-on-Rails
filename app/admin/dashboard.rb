# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      columns do
        panel 'Notes' do
          div do 
            Note.all.map do |note|
              div(class:"small_section") do
                h4 note.title
                h5 raw note.body
                div link_to('Show note', admin_note_path(note))
              end
            end
          end
        end

        panel 'Subjects' do
          div do
            Subject.all.map do |subject|
              div(class:"small_section") do
                h4 subject.id
                h5 subject.name
                div link_to('Show subject', admin_subject_path(subject))
              end
            end
          end
        end
      end
      
    end
        
    

  end
end
