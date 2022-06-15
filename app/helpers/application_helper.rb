module ApplicationHelper
  def link_to_add_fields(name, form, association, response = '.response', css = nil)
    new_object = form.object.send(association).klass.new
    id         = new_object.object_id
    fields     = form.fields_for(association, new_object, child_index: id) do |builder|
      render("#{ association.to_s.singularize }_fields", f: builder)
    end
    link_to(name, 'javascript:;', class: "add_fields btn btn-primary #{ css }", data: { id: id, fields: fields.gsub('\n', ''), response: response })
  end
end
