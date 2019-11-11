class MonsterSeed
    def self.seed
        Monster.destroy_all

        monsters = JSON.parse(RestClient.get("http://dnd5eapi.co/api/monsters"))["results"]
        
        monsters.each{|monster|
            challenge_rating = JSON.parse(RestClient.get(monster["url"]))["challenge_rating"]
            Monster.create(name: monster["name"], url: monster["url"], challenge_rating: challenge_rating)
        }
    end
end



