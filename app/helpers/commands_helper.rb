module CommandsHelper


	def ocuped location, locations_ocuped, vertical = false
		if locations_ocuped.include?(location)
			if vertical
				return image_tag('mesaOccuped2.png', :alt => 'mesaOccuped', style: "width: 100%; height: 100%;")
			else
				return image_tag('mesaOccuped.png', :alt => 'mesaOccuped', style: "width: 100%; height: 100%;")
			end
		else
			if vertical
				return image_tag('mesaNotSelected2.png', :alt => 'mesaNotSelected', style: "width: 100%; height: 100%;")
			else
				return image_tag('mesaNotSelected.png', :alt => 'mesaNotSelected', style: "width: 100%; height: 100%;")
			end 
		end
	end
end
