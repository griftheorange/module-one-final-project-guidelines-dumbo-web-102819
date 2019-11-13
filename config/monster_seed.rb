class MonsterSeed
    def self.seed
        Monster.destroy_all

        # monsters = JSON.parse(RestClient.get("http://dnd5eapi.co/api/monsters"))["results"]
        
        # monsters.each{|monster|
        #     details_hash = JSON.parse(RestClient.get(monster["url"]))
        #     challenge_rating = details_hash["challenge_rating"]
        #     type = details_hash["type"]
        #     sub_type = details_hash["subtype"]
        #     alignment = details_hash['alignment']
        #     Monster.create(name: monster["name"], url: monster["url"], challenge_rating: challenge_rating, monster_type: type, sub_type: sub_type, alignment: alignment)
        # }


        url = "https://api.open5e.com/monsters/?format=json"
        new_url = url
        monsters = JSON.parse(RestClient.get(new_url))["results"]
        self.add_monsters(monsters, new_url)

        count = 2
        21.times do 
            new_url = url + "&page=#{count}"
            count += 1
            monsters = JSON.parse(RestClient.get(new_url))["results"]
            self.add_monsters(monsters, new_url)
        end
    end

    def self.add_monsters(monsters, new_url)
        monsters.each{|monster|
            challenge_rating = monster['challenge_rating']
            type = monster['type']
            sub_type = monster['subtype']
            alignment = monster['alignment']
            Monster.create(name: monster["name"], url: new_url, challenge_rating: challenge_rating, monster_type: type, sub_type: sub_type, alignment: alignment)
        }
    end
end



