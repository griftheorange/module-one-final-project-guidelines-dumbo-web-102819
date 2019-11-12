class Interface
    def login
        system "clear"
        puts <<-HEREDOC
        Name:__________________________________________  ________     ____   ________   
Race:__________________________________________  \______ \   /  _ \  \______ \  
Class:_________________________________________   |    |  \  >  _ </\ |    |  \ 
Alignment:_____________________________________   |    `   \/  <_\ \/ |    `   \
Background:____________________________________  /_______  /\_____\ \/_______  /
Level & XP:____________________________________          \/        \/        \/ 
+-------------------------------------+  +-AC-------+ +-Ini------+ +-Speed-----+
| Inspiration                    [  ] |  |          | |          | |           |
| Proficiency Bonus              [  ] |  +----------+ +----------+ +-----------+
| Passive Wisdom (Perception)    [  ] |  +-Hit Points--------------------------+
+-------------------------------------+  | Maximum:                            |
| STRENGTH                  [  ] [  ] |  | Modifier:                           |
| Saving Throws              [ ] [  ] |  | Current:                            |
| Athlethic                  [ ] [  ] |  | Hit Dice:                           |
+-------------------------------------+  +-Death Saves-------------------------+
| DEXTERITY                 [  ] [  ] |  | Successes               [ ] [ ] [ ] |
| Saving Throws              [ ] [  ] |  | Failures                [ ] [ ] [ ] |
| Acrobatics                 [ ] [  ] |  +-------------------------------------+
| Sleight of Hand            [ ] [  ] |  +-Other Proficiencies & Languages-----+
| Stealth                    [ ] [  ] |  |                                     |
+-------------------------------------+  |                                     |
| CONSTITUTION              [  ] [  ] |  |                                     |
| Saving Throws              [ ] [  ] |  |                                     |
+-------------------------------------+  |                                     |
| INTELLIGENCE              [  ] [  ] |  |                                     |
| Saving Throws              [ ] [  ] |  |                                     |
| Arcana                     [ ] [  ] |  |                                     |
| History                    [ ] [  ] |  |                                     |
| Investigation              [ ] [  ] |  |                                     |
| Nature                     [ ] [  ] |  |                                     |
| Religion                   [ ] [  ] |  |                                     |
+-------------------------------------+  |                                     |
| WISDOM                    [  ] [  ] |  |                                     |
| Saving Throws              [ ] [  ] |  |                                     |
| Animal Handling            [ ] [  ] |  |                                     |
| Insight                    [ ] [  ] |  |                                     |
| Medicine                   [ ] [  ] |  |                                     |
| Perception                 [ ] [  ] |  |                                     |
| Survival                   [ ] [  ] |  |                                     |
+-------------------------------------+  |                                     |
| CHARISMA                  [  ] [  ] |  |                                     |
| Saving Throws              [ ] [  ] |  |                                     |
| Deception                  [ ] [  ] |  |                                     |
| Intimidation               [ ] [  ] |  |                                     |
| Performance                [ ] [  ] |  |                                     |
| Persuation                 [ ] [  ] |  |                                     |
+-------------------------------------+  +-------------------------------------+
+-Weapon--------+-ATK B.-+-Damage/Typ-+-Properties--------------------+-Weight-+
|               |        |            |                               |        |
|               |        |            |                               |        |
|               |        |            |                               |        |
|               |        |            |                               |        |
|               |        |            |                               |        |
|               |        |            |                               |        |
+-Armor/Shild---+-AC B.--+-Properties-+-------------------------------+-Weight-+
|               |        |                                            |        |
|               |        |                                            |        |
|               |        |                                            |        |
|               |        |                                            |        |
+---------------+--------+--------------------------------------------+--------+

        HEREDOC
        puts "Welcome to our MyFirstDnD App!!"
        puts "Please enter your username. (Q to quit)"
        input = gets.chomp
        if input == 'Q'
            abort
        end
        user = User.where("username = ?", input)
        if !user.empty?
            @user = user[0]
            main_menu
        else
            new_user_prompt(input)
        end
    end

    def new_user_prompt(name)
        puts "I don't recognize that username. Would you like to make a new user? (Y/N)"
        input = gets.chomp
        case input
        when 'Y'
            @user = User.create(username: name)
            main_menu
        when 'N'
            login
        end
    end

    def main_menu

    end

    def loc_men_test
        @user = User.first
        @story = Story.first
        @location = World.first.locations.first
        location_menu
    end

    #have @user, @story, @location, Locations main menu for interaction
    def location_menu
        world = @location.world
        location = @location
        system 'clear'
        while true
            puts ''
            puts "World: #{world.name}"
            puts "Location: #{location.name}"
            puts <<-HEREDOC
            What would you like to do?
                1. See monster catalogue
                2. See all monster types
                3. Find monsters by type
                4. Find monsters by challenge rating
                5. Get monster's details
                6. List monsters at this location
                7. List locations a monster shows up in in your story
                8. Add a monster to this location
                9. Remove a monster from this location
                10. Select random monster from this location
                11. Roll Dice d20
                12. Back to story
            HEREDOC


            input = gets.chomp
            case input
            #see catalogue    
            when '1' || '1.'
                puts Monster.all.map{|monster| monster.name}



            #see all monster types
            when '2' || '2.'
                puts Monster.get_all_types


            #find monsters by type
            when '3' || '3.'
                puts "What type do you want to search?"
                input = gets.chomp.downcase
                puts Monster.by_type(input).map{|monster| monster.name}

            #gets monsters by challenge rating
            when '4' || '4.'
                puts "What challenge rating are you looking for? A wolf has a cr of 0.25, where a bear's would be 1"
                input = gets.chomp.downcase
               
                if input == '0'
                    puts Monster.by_cr(0).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}
                elsif input.to_f == 0
                    puts "That is not a valid number"
                    next
                else
                    puts Monster.by_cr(input.to_f).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}
                end


            #gets monsters details
            when '5' || '5.'
                puts "What monster would you like to see?"
                input = gets.chomp.downcase
                #check input is a findable monster
                if Monster.where("name LIKE ?", input).empty?
                    puts "That is not a valid monster"
                    next
                end
                puts Monster.name_is(input).details


            #list monsters at this location
            when '6' || '6.'
                puts @location.monsters.map{|monster| monster.name}


            #lists other locations you've put a monster in for this story
            when '7' || '7.'
                puts 'Which monster?'
                input = gets.chomp.downcase
                #check input is a findable monster
                if Monster.where("name LIKE ?", input).empty?
                    puts "That is not a valid monster"
                    next
                end
                mons = Monster.name_is(input)
                story_locations = @story.locations.map{|loc| loc.name}
                binding.pry
                locations = mons.locations.select{|location|
                    story_locations.include?(location.name)
                }
                puts "This monster shows up in:"
                puts locations.map{|location| location.name}


            #add a monster to this location, will not duplicate
            when '8' || '8.'
                puts 'What monster would you like to add here?'
                input = gets.chomp.downcase
                #check input is a findable monster
                if Monster.where("name LIKE ?", input).empty?
                    puts "That is not a valid monster"
                    next
                end
                mons = Monster.name_is(input)
                LocationMonster.find_or_create_by(location_id: @location.id, monster_id: mons.id)
                # this is resetting the database search, so i dont get any bugs
                @location = Location.find(@location.id)


            #removes a monster from this lacation
            when '9' || '9.'
                puts 'What monster would you like to remove?'
                input = gets.chomp.downcase
                #check input is a findable monster
                if Monster.where("name LIKE ?", input).empty?
                    puts "That is not a valid monster"
                    next
                end
                mons = Monster.name_is(input)
                LocationMonster.find_by(location_id: @location.id, monster_id: mons.id).destroy
                #this is resetting the database search, so i dont get any bugs
                @location = Location.find(@location.id)






            #select random monster from this location
            when '10' || '10.'
                puts @location.monsters.sample.name

            #rolls dice
            when '11' || '11.'
                puts "Rolled: " + (1...20).to_a.sample.to_s

            #returns to story menu
            when '12' || '12.'
                @location = nil
                story_menu
            end
        end
    end
end