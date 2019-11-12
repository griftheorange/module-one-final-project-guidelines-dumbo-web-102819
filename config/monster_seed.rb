class MonsterSeed
    def self.seed
        Monster.destroy_all

        monsters = JSON.parse(RestClient.get("http://dnd5eapi.co/api/monsters"))["results"]
        
        monsters.each{|monster|
            details_hash = JSON.parse(RestClient.get(monster["url"]))
            challenge_rating = details_hash["challenge_rating"]
            type = details_hash["type"]
            Monster.create(name: monster["name"], url: monster["url"], challenge_rating: challenge_rating, monster_type: type)
        }
    end
end



