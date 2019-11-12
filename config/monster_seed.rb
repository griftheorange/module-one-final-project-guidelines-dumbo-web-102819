class MonsterSeed
    def self.seed
        Monster.destroy_all

        monsters = JSON.parse(RestClient.get("http://dnd5eapi.co/api/monsters"))["results"]
        
        monsters.each{|monster|
            details_hash = JSON.parse(RestClient.get(monster["url"]))
            challenge_rating = details_hash["challenge_rating"]
            type = details_hash["type"]
            sub_type = details_hash["subtype"]
            alignment = details_hash['alignment']
            Monster.create(name: monster["name"], url: monster["url"], challenge_rating: challenge_rating, monster_type: type, sub_type: sub_type, alignment: alignment)
        }
    end
end



