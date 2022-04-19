ActiveAdmin.register Note do

  permit_params :title, :body, :subject_id

  form do |f|
    f.inputs 'Note' do
      f.input :subject
      f.input :title
      f.input :body, as: :quill_editor
    end
    f.actions
  end

  show do
    h2 note.title
    div note.subject.name
    h4(class: 'note-body') do
      raw note.body
    end
  end

  index do
    selectable_column
    column 'Note ID' do |note|
      note.id
    end
    column 'Note Title' do |note|
      note.id
    end
    column 'Note content' do |note|
      raw note.body.truncate_words(3)
    end
    column :subject
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :subject_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :subject_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
