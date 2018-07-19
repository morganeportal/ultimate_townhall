class Index
	def initialize
		puts ""
		puts "Tu veux scrapper Coco ? Y/N"
		print ">"
		yn = gets.chomp
			if yn == "Y"
				puts ""
				puts "-- Please wait while scrapping --"
				town_halls = TownhallsScrapper.new
				town_halls_to_db = TownhallsAdderToDB.new(town_halls.townhalls_names_emails)
				puts "Le JSON et le CSV sont dispo dans le dossier db"
				puts ""
				puts "-- réinitialisation du programme --"
				done = Done.new
			else
				abort("Wrong answer. Ciao")
			end
	end
end