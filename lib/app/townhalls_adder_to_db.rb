class TownhallsAdderToDB
	def initialize(array)
		File.open("db/townhalls.json","w") do |f|
  		f.write(JSON.pretty_generate(array))
  	end

		CSV.open("db/townhalls.csv", "w") do |csv|
      JSON.parse(File.open("db/townhalls.json").read).each do |hash|
    		csv << hash.values
    	end
  	end
  end
end