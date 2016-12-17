module ApplicationHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, params.merge(:sort => column, :direction => direction, :page => nil).permit, {:class => css_class}
	end

	def emojify(content)
		h(content).to_str.gsub(/:([\w+-]+):/) do |match|
			if emoji = Emoji.find_by_alias($1)
				%(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
			else
			match
			end
		end.html_safe if content.present?
	end
end