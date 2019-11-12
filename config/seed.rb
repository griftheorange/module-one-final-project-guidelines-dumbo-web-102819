class MySeed
    def self.seed
        User.destroy_all
        Story.destroy_all
        World.destroy_all
        Location.destroy_all
        LocationMonster.destroy_all

        u1 = User.create(username: 'Khobol')
        u2 = User.create(username: 'GG')
        u3 = User.create(username: 'Toxsik')

        s1 = Story.create(story_name: 'The Great Debacle', user_id: u1.id)
        s2 = Story.create(story_name: 'The Winter Is Coming', user_id: u2.id)
        s3 = Story.create(story_name: 'Before the Storm', user_id: u3.id)

        w1 = World.create(name: "Azeroth", story_id: s1.id)
        w2 = World.create(name: "I Have No Idea", story_id: s2.id)
        w3 = World.create(name: "Earth 42", story_id: s3.id)
        w4 = World.create(name: "Blackmoor", story_id: s1.id)
        w5 = World.create(name: "Greyhawk", story_id: s2.id)
        w6 = World.create(name: "Forgotten Realms", story_id: s3.id)
        w7 = World.create(name: "Mystara", story_id: s1.id)
        w8 = World.create(name: "Ravenloft", story_id: s2.id)
        w9 = World.create(name: "Pelinore", story_id: s3.id)
        w10 = World.create(name: "Dragonlance", story_id: s1.id)
        w11 = World.create(name: "Kara-Tur", story_id: s2.id)
        w12 = World.create(name: "Spelljammer", story_id: s3.id)
        w13 = World.create(name: "Dark Sun", story_id: s1.id)
        w14 = World.create(name: "Al-Qadim", story_id: s2.id)
        w15 = World.create(name: "Birthright", story_id: s3.id)
        w16 = World.create(name: "Council of Wyrms", story_id: s1.id)
        w17 = World.create(name: "Planescape", story_id: s2.id)
        w18 = World.create(name: "Jakandor", story_id: s3.id)
        w19 = World.create(name: "Rokugan", story_id: s1.id)
        w20 = World.create(name: "Dragon Fist", story_id: s2.id)

        l1 = Location.create(name: 'Orgrimmar', world_id: w1.id)
        l2 = Location.create(name: 'Undercity', world_id: w1.id)
        l3 = Location.create(name: 'I Don\'t Know', world_id: w2.id)
        l4 = Location.create(name: 'Narnia and Something Something', world_id: w2.id)
        l5 = Location.create(name: 'The Last Colony', world_id: w3.id)
        l6 = Location.create(name: 'The Second To Last Colony', world_id: w3.id)
        l7 = Location.create(name: 'This is Definitely The Last Colony, No Relation', world_id: w3.id)
        l8 = Location.create(name: "Waterdeep" , world_id:w6.id)
        l9 = Location.create(name: "Neverwinter" , world_id:w6.id)
        l10 = Location.create(name: "Sward Coast", world_id:w6.id)
        l11 = Location.create(name: "Underchasm", world_id:w3.id)
        l12 = Location.create(name: "Deadstone Cleft", world_id:w5.id)
        l13 = Location.create(name: "Rainbow Gorge", world_id:w16.id)
        l14 = Location.create(name: "Silverymoon", world_id:w2.id)
        l15 = Location.create(name: "Menzoberranzan", world_id:w11.id)
        l16 = Location.create(name: "Elturel", world_id:w10.id)
        l17 = Location.create(name: "Luskan", world_id:w10.id)

        l1.add_random_monster_to_location
        l1.add_random_monster_to_location

        LocationMonster.create(monster_id: l1.monsters.first.id, location_id: l4.id)
        LocationMonster.create(monster_id: Monster.last.id, location_id: l4.id)
    end
end