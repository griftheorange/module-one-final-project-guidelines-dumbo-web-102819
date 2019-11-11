class MySeed
    def self.seed
        User.destroy_all
        Story.destroy_all
        World.destroy_all
        Location.destroy_all
        Monster.destroy_all

        u1 = User.create(username: 'Khobol')
        u2 = User.create(username: 'GG')
        u3 = User.create(username: 'Toxsik')

        s1 = Story.create(story_name: 'The Great Debacle', user_id: u1.id)
        s2 = Story.create(story_name: 'The Winter Is Coming', user_id: u2.id)
        s3 = Story.create(story_name: 'Before the Storm', user_id: u3.id)

        w1 = World.create(name: "Azeroth", story_id: s1.id)
        w2 = World.create(name: "I Have No Idea", story_id: s2.id)
        w3 = World.create(name: "Earth 42", story_id: s3.id)

        l1 = Location.create(name: 'Orgrimmar', world_id: w1.id)
        l2 = Location.create(name: 'Undercity', world_id: w1.id)
        l3 = Location.create(name: 'I Don\'t Know', world_id: w2.id)
        l4 = Location.create(name: 'Narnia and Something Something', world_id: w2.id)
        l5 = Location.create(name: 'The Last Colony', world_id: w3.id)
        l6 = Location.create(name: 'The Second To Last Colony', world_id: w3.id)
        l7 = Location.create(name: 'This is Definitely The Last Colony, No Relation', world_id: w3.id)

        
        monsters = JSON.parse(RestClient.get("http://dnd5eapi.co/api/monsters"))["results"]
        
        monsters.each{|monster|
            Monster.create(name: monster["name"], url: monster["url"])
        }

    end
end