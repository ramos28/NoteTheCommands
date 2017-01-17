module CommandsHelper


	def ocuped location, locations_ocuped, vertical = false
		if locations_ocuped.include?(location)
			if vertical
				return image_tag('mesaOccuped2.png', :alt => 'mesaOccuped')
			else
				return image_tag('mesaOccuped.png', :alt => 'mesaOccuped')
			end
		else
			if vertical
				return image_tag('mesaNotSelected2.png', :alt => 'mesaNotSelected')
			else
				return image_tag('mesaNotSelected.png', :alt => 'mesaNotSelected')
			end 
		end
	end
end
