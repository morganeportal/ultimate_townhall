class TownhallsScrapper
	attr_accessor :townhalls_names_emails
	def initialize
		url_townhalls = []
		townhalls_names = []
		townhalls_emails = []
		@townhalls_names_emails = []

		Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")).css('.lientxt').each do |town|	# Récupère les noms et les adresses url des mairies du 95 et les stocke dans des arrays
			url_townhalls << "http://annuaire-des-mairies.com/95/#{town.text.downcase.gsub(" ","-")}.html"		
			townhalls_names << town.text.downcase.gsub(" ","-")
		end

		url_townhalls.each do |url_townhall|
			@url_townhall_temp = url_townhall
			townhalls_emails << Nokogiri::HTML(open(@url_townhall_temp)).css('section[2] tr[4] td[2]').text		# Récupère les adresses e-mail des mairies et les stocke dans un arrray
		end

		townhalls_names.each_with_index do |townhall_name, i|
			hash_temp = {}
			hash_temp["name"] = townhalls_names[i]
			hash_temp["email"] = townhalls_emails[i]
			@townhalls_names_emails << hash_temp																	# Combine les arrays des noms de mairies et leurs e-mails en un hash					
		end
	end
end