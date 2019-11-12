
class Interface
    # attr_reader :user, :stories


    def login
        system "clear"
        rasda = 'testnig'
        puts "Testing: #{rasda}"
        puts <<-HEREDOC
        11111111111111111111111111111111111111001111111111111111111111111
        11111111111111111111111111111111111100011111111111111111111111111
        11111111111111111111111111111111100001111111111111111111111111111
        11111111111111111111111111111110000111111111111111111111111111111
        11111111111111111111111111111000000111111111111111111111111111111
        11111111111111111100000000000000000000000000000000011111111111111
        11111111111111111111111111100000011110001100000000000000011111111
        11111111111111111111111000000000000000000000000000000000111111111
        11111111111111110111000000000000000000000000000011111111111111111
        11111111111111111100011100000000000000000000000000000111111111111
        11111111111111100000110000000000011000000000000000000011111111111
        11111111111111000000000000000100111100000000000001100000111111111
        11111111110000000000000000001110111110000000000000111000011111111
        11111111000000000000000000011111111100000000000000011110001111111
        11111110000000011111111111111111111100000000000000001111100111111
        11111111110111111111111111111100000000000000000000000111111111111
        11111111111111110000000000000000000000000000000000000111111111111
        11111111111111111100000000000000000000000000001100000111111111111
        11111111000001111111111111111111110000000000000000001111111111111
        11111111111111000000000000000000000000000000111100000111111111111
        11111111111000000000000000000000000000000001111110000111111111111
        11111111100000000000000000000000000000001111111110000111111111111
        11111110000000000000000000000000000000111111111110000111111111111
        11111100000000000000000001110000001111111111111110001111111111111
        11111000000000000000011111111111111111111111111110011111111111111
        11110000000000000001111111111111111100111111111111111111111111111
        11100000000000000011111111111111111111100001111111111111111111111
        11100000000001000111111111111111111111111000001111111111111111111
        11000000000001100111111111111111111111111110000000111111111111111
        11000000000000111011111111111100011111000011100000001111111111111
        11000000000000011111111111111111000111110000000000000011111111111
        11000000000000000011111111111111000000000000000000000000111111111
        11001000000000000000001111111110000000000000000000000000001111111
        11100110000000000001111111110000000000000000111000000000000111111
        11110110000000000000000000000000000000000111111111110000000011111
        11111110000000000000000000000000000000001111111111111100000001111
        11111110000010000000000000000001100000000111011111111110000001111
        11111111000111110000000000000111110000000000111111111110110000111
        11111110001111111100010000000001111100000111111111111111110000111
        11111110001111111111111110000000111111100000000111111111111000111
        11111111001111111111111111111000000111111111111111111111111100011
        11111111101111111111111111111110000111111111111111111111111001111
        11111111111111111111111111111110001111111111111111111111100111111
        11111111111111111111111111111111001111111111111111111111001111111
        11111111111111111111111111111111100111111111111111111111111111111
        11111111111111111111111111111111110111111111111111111111111111111
        11111111111111111110000000000000000000000000000000111111111111111
        HEREDOC

        puts "OFF WE GO! The beginning of your adventure!"
        puts "Type down your username please! (Q to quit)"
        input = gets.chomp

        # puts "TESTING Inputs #{input}"
        if input.upcase == 'Q'
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
        input = gets.chomp.upcase!

        case input
        when 'Y'
            @user = User.create(username: name)
            main_menu
        when 'N'
            login
        end
    end

    def menu_options
        puts "~~~Welcome to the Main Menu~~~\n\n" 
        puts "{1} Continue from previous story "
        puts "{2} Create new story"
        puts "{3} Delete a story"
        puts "{4} Tutorial"
    end 


    def delete_story 
        # puts "Are you sure you want to delet"
        system "clear"
        puts "Which story would you like to delete? \n"
        @user.stories.each do |my_story_instance|
        puts my_story_instance.story_name 
        end 
        
    end 

    def main_menu

        menu_options 
        p "\n\nPlease select one of the menu options ==> "
        input = gets.chomp.to_i

        while input != 1 && input != 2 && input != 3 && input != 4 
            system "clear" 
            menu_options 
            p "Your value of { #{input} } was invalid. Please select again (1 - 4) ==> " 
            input = gets.chomp.to_i
        end
        
        case input 
        when 1
            puts "option 1"
        when 2 
            story_menu
        when 3 
            delete_story
        when 4 
            puts "option 4"
        end 
        
    end

#MAIN MENU ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#######################################################################################################################################
#######################################################################################################################################
#Location Menu below

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
                challenge_rating_search

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


    def challenge_rating_search
        while true
            puts <<-HEREDOC
            What operation do you need?
            =
            >
            < 
            >=
            <=
            HEREDOC
            input = gets.chomp
            if !(input == '=' || input == '>' || input == '<' || input == '>=' || input == '<=')
                puts "That is not a valid input"
            else
                while true
                    puts 'Specify challenge rating.'
                    cr = gets.chomp
                    if cr == '0'
                        cr = 0
                    elsif cr.to_f == 0
                        puts "That is not a valid number"
                        next
                    else
                        case input
                        when '='
                            puts Monster.where('challenge_rating = ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}
                        when '>'
                            puts Monster.where('challenge_rating > ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}
                        when '<'
                            puts Monster.where('challenge_rating < ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}
                        when '>='
                            puts Monster.where('challenge_rating >= ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}
                        when '<='
                            puts Monster.where('challenge_rating <= ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}
                        end
                        break
                    end
                end
                break
            end
        end
    end

#Location Menu ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
##############################################################################################################
########################GGGGGGGGG############################################################################
#Story Menu Below

    def story_menu_test
        @user = User.second
        @story = Story.third
        story_menu
    end 

    def story_menu
        choices_for_users
        
        
        list_of_locations_for_world
        
        input = gets.chomp
    end 
    private 
    def choices_for_users
        puts "Your story name '#{@story.story_name}'"
        puts "Worlds in '#{@story.story_name}':" 
        puts @story.worlds.map{|world| world.name}
  
        puts "Which world do you want to conquer?"
    end 

    def list_of_locations_for_world
        input = gets.chomp
        world_names = World.all.map{|world| world.name}

        if world_names.include?(input)
            @world = World.find_by(name: input)
            puts @world.locations.map{|location| location.name}
            puts "Choose a location to see their monsters!!"
        else
            choices_for_users
            

        end 
    end 
  ###################GGGGGGG############################ 
end