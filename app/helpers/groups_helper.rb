module GroupsHelper

  def make_group(groups)
    html_values = ''
    groups.each do |group|
      html_values << group.name
    end
    html_values.html_safe
  end


end