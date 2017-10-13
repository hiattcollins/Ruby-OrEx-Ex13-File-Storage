class CarReader

	def getMakes
		results = File.readlines("car-makes.txt", "r+")

		car_makes = results[0].split(/\n/)

		return car_makes
	end


	def getModels
		results = File.readlines("car-models.txt", "r+")

		car_models = results[0].split(/\n/)

		return car_models
	end	


	def listModelsByMake

		makes_array = getMakes
		models_array = getModels

		makes_and_models = Hash.new

		makes_array.each do |element_makes|

			first_letter = element_makes[0]

			selected_models = Array.new

			models_array.each do |element_models|
				if element_models[0] == first_letter
					selected_models.push(element_models[2..-1])
				end
			end

			makes_and_models[element_makes] = selected_models

		end

		return makes_and_models
	end


end

get_all_cars = CarReader.new

p get_all_cars.listModelsByMake