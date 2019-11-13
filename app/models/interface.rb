
class Interface
    # attr_reader :user, :stories

#LOGIN SCREEN BELOW 
##############################################################################################################
##############################################################################################################

    def login
        @print_pause = 0.005
        system "clear"
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

        puts "Welcome to My First D&D!"
        puts "Please give us your username! (Q to quit)"
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

#LOGIN SCREEN ABOVE ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
##############################################################################################################
##############################################################################################################



#MAIN MENU BELOW 
##############################################################################################################
##############################################################################################################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTIONSQ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
def menu_options
        system "clear"
        puts "~~~Welcome #{@user} to the Main Menu~~~\n\n" 
        puts "{1} Continue from previous story "
        puts "{2} Create new story"
        puts "{3} Delete a story"
        puts "{4} Tutorial"
        puts "{5} End My Session"
end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# u1 = User.create(username: 'Khobol')
       
# s1 = Story.create(story_name: 'The Great Debacle', user_id: u1.id)
        
# w1 = World.create(name: "Azeroth", story_id: s1.id)
        
# l1 = Location.create(name: 'Orgrimmar', world_id: w1.id)
        
def prev_story_screen
    system "clear"
        puts "~~~Welcome to your story logs~~~"
        puts "Which adventure would you like to pick up? ==> "
        
        
        @user.stories.each do |story| 
        puts story.story_name
        end

        input = gets.chomp
        @story = Story.find_by(story_name: input)
        story_menu

end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

def story_menu_test

end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

    def delete_story 
        # puts "Are you sure you want to delete"
        system "clear"
        puts "Which story would you like to delete? \n"

             @user.stories.each do |my_story_instance|
                 puts my_story_instance.story_name 
             end

        input2 = gets.chomp.to_i

            if input2 == 1
                puts "thank yiu for your choice"
            end    
    end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 4 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

def  tutorial

end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 5 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
def endscreen
    @user = nil
    login
end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


    def main_menu
      while true 
        menu_options 
        print "\n\nPlease select one of the menu options ==> "
        input = gets.chomp.to_i

        while (input < 1 || input > 5)
            system "clear" 
            menu_options 
            print "Your value of { #{input} } was invalid. Please select again (1 - 4) ==> " 
            input = gets.chomp.to_i
        end
        
        case input 
        when 1
            prev_story_screen
        when 2 
            story_menu_test
        when 3 
            delete_story
        when 4 
            tutorial
        when 5
            endscreen 
        end 
      end
    end
    

#MAIN MENU ABOVE ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
##############################################################################################################
##############################################################################################################



#Location Menu BELOW 
##############################################################################################################
##############################################################################################################

    def loc_men_test
        @user = User.first
        @story = Story.first
        @location = World.first.locations.first
        location_menu
    end

    #have @user, @story, @location, Locations main menu for interaction
    def location_menu
        @print_pause = 0.005
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
        5. Search monsters
        6. Get monster's details
        7. List monsters at this location
        8. List locations a monster shows up in in your story
        9. Add a monster to this location
        10. Remove a monster from this location
        11. Select random monster from this location
        12. Roll Dice d20
        13. Back to story
        HEREDOC


            input = gets.chomp
            sleep(1)
            case input
            #see catalogue    
            when '1' || '1.'
                puts_with_delay(Monster.all.map{|monster| monster.name}, 0.005)
                puts "That's an aweful lot of monsters, some people have way too much time on their hands.".green
                puts "Try sifting through them with other options!".green



            #see all monster types
            when '2' || '2.'
                sleep(1)
                puts ''
                puts ''
                puts 'Monster Types:'.green
                mons_type = Monster.get_all_types
                mons_type.each{|type|
                    sleep(@print_pause)
                    puts type
                }



            #find monsters by type
            when '3' || '3.'
                puts "What type do you want to search?"
                input = gets.chomp.downcase
                sleep(1)
                if !Monster.get_all_types.include?(input.capitalize)
                    puts "That is not a valid monster type."
                else
                    puts ''
                   mons = Monster.by_type(input).map{|monster| monster.name}
                   mons.each{|monster| 
                    sleep(@print_pause)
                    puts monster
                    }
                    case input
                    when 'fiends'
                        puts "Turns out Plaresh is the only fiend, so why is it plural?".green
                    when 'humanoids'
                        puts "Ok sure Wizards. Maybe try looking at the other humanoid type?".green
                    end
                end

            #gets monsters by challenge rating
            when '4' || '4.'
                challenge_rating_search

            #searches monster by name
            when '5' || '5.'
                search_by_name

            #gets monsters details
            when '6' || '6.'
                puts "What monster would you like to see?"
                input = gets.chomp.downcase
                sleep(1)
                #check input is a findable monster
                if Monster.where("name LIKE ?", input).empty?
                    puts "That is not a valid monster"
                    next
                end
                mons_hash = Monster.name_is(input).details
                url_or_print_out_prompt(mons_hash)


            #list monsters at this location
            when '7' || '7.'
                puts ''
                puts "At #{@location.name}:".green
                puts_with_delay(@location.monsters.map{|monster| monster.name}, 0.2)
                sleep(1)


            #lists other locations you've put a monster in for this story
            when '8' || '8.'
                puts 'Which monster would you like to know the locations for?'
                input = gets.chomp.downcase
                sleep(1)
                puts ''
                #check input is a findable monster
                if Monster.where("name LIKE ?", input).empty?
                    puts "That is not a valid monster"
                    sleep(1)
                    next
                end
                mons = Monster.name_is(input)
                story_locations = @story.locations.map{|loc| loc.name}
                locations = mons.locations.select{|location|
                    story_locations.include?(location.name)
                }
                print "#{input.capitalize} ".green
                puts 'is found in:'
                puts_with_delay(locations.map{|location| location.name}, 0.2)
                sleep(1)


            #add a monster to this location, will not duplicate
            when '9' || '9.'
                puts 'What monster would you like to add here?'
                input = gets.chomp.downcase
                sleep(1)
                #check input is a findable monster
                if Monster.where("name LIKE ?", input).empty?
                    puts "That is not a valid monster"
                    next
                end
                mons = Monster.name_is(input)
                LocationMonster.find_or_create_by(location_id: @location.id, monster_id: mons.id)
                # this is resetting the database search, so i dont get any bugs
                @location = Location.find(@location.id)
                print "#{input.capitalize} ".green
                print "has been added to "
                puts "#{@location.name}".green
                sleep(1)


            #removes a monster from this lacation
            when '10' || '10.'
                puts 'What monster would you like to remove?'
                input = gets.chomp.downcase
                sleep(1)
                #check input is a findable monster
                if Monster.where("name LIKE ?", input).empty?
                    puts ''
                    puts "That is not a valid monster"
                    sleep(1)
                    next
                end
                puts ''
                mons = Monster.name_is(input)
                joiner = LocationMonster.find_by(location_id: @location.id, monster_id: mons.id)
                if joiner == nil
                    print "#{input.capitalize} ".green
                    puts "was not found at this location."
                    sleep(1)
                else
                    joiner.destroy
                    print "#{input.capitalize} ".green
                    puts "was removed from this location."
                    sleep(1)
                end
                #this is resetting the database search, so i dont get any bugs
                @location = Location.find(@location.id)






            #select random monster from this location
            when '11' || '11.'
                puts ''
                mons = @location.monsters.sample
                print mons.name.green
                puts " was selected."
                puts ''
                while true
                    sleep(1)
                    print 'Would you like '
                    print "#{mons.name.green}'s "
                    puts "details? (Y/N)"
                    puts ''
                    input = gets.chomp.downcase
                    sleep(1)
                    case input
                    when 'y'
                        url_or_print_out_prompt(mons.details)
                        break
                    when 'n'
                        break
                    else
                        puts "That is not a valid input."
                    end
                end

            #rolls dice
            when '12' || '12.'
                roll = (1..20).to_a.sample.to_s
                puts "Rolled: " + "#{roll}"
                if roll == '20'
                    puts "CRITICAL SUCCESS!!!".green
                elsif roll == '1'
                    puts "CRITICAL FAILURE!!! YOU DIE!".red
                end
                puts ''
                sleep (1)

            #returns to story menu
            when '13' || '13.'
                @location = nil
                story_menu
            end
        end
    end

    def url_or_print_out_prompt(mons_hash)
        while true
            name = mons_hash['name'].green
            puts <<-HEREDOC
            For #{name}
            Would you like their details:
            1. Printed out
            2. Online
            HEREDOC
            input = gets.chomp
            sleep(1)
            case input
            when '1' || '1.'
                sleep(1)
                puts ''
                puts ''
                important = ['name', 'size', 'challenge_rating', 'type', 'subtype','alignment', 'armor_class', 'hit_points', 'hit_dice', 'speed', 'strength', 'dexterity', 'constitution', 'intelligence', 'wisdom', 'charisma', 'perception', 'actions']
                important.each{|topic|
                        if topic != 'actions'
                            puts (topic.capitalize + ': ' + mons_hash[topic].to_s)
                        else
                            put_actions(mons_hash)
                        end
                        sleep(0.1)
                }
                break
            when '2' || '2.'
                url = 'https://open5e.com/monsters/'
                name = mons_hash['name'].gsub(',', '').gsub("'", '').gsub(' ', '-').downcase
                url += name
                Launchy.open(url)
                break
            else
                'That is not a valid input.'
            end
        end
        
    end

    def put_actions(mons_hash)
        puts ''
        puts "#{mons_hash['name']}'s Actions:".green
        puts ''
        actions = mons_hash['actions']
        actions.each{|action|
            puts "Name: #{action['name']}".green
            puts action['desc']
            puts ''
            puts ''
            sleep(0.1)
        }
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
            sleep(1)
            if !(input == '=' || input == '>' || input == '<' || input == '>=' || input == '<=')
                puts "That is not a valid input"
            else
                while true
                    puts "Specify challenge rating. 1-30. A wolf has a cr of 1/4, where a bear's is 1."
                    cr = gets.chomp
                    sleep(1)
                    if cr == '0'
                        cr = 0
                    elsif cr.to_f == 0
                        puts "That is not a valid number"
                        next
                    else
                        case input
                        when '='
                            puts_with_delay(Monster.where('challenge_rating = ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}, @print_pause)
                        when '>'
                            puts_with_delay(Monster.where('challenge_rating > ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}, @print_pause)
                        when '<'
                            puts_with_delay(Monster.where('challenge_rating < ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}, @print_pause)
                        when '>='
                            puts_with_delay(Monster.where('challenge_rating >= ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}, @print_pause)
                        when '<='
                            puts_with_delay(Monster.where('challenge_rating <= ?', cr).order(:challenge_rating).map{|monster| monster.name + ' ' + monster.challenge_rating.to_s}, @print_pause)
                        end
                        break
                    end
                end
                break
            end
        end
    end

    def search_by_name
        while true
            sleep(1)
            puts ''
            puts "What would you like to search by?"
            puts ''
            puts <<-HEREDOC
            1. Starts with
            2. Includes
            3. Ends with
            HEREDOC
            input1 = gets.chomp.downcase
            puts ''
            case input1
            when '1' || '1.'
                puts 'What is your search criteria?'
                input = gets.chomp.downcase
                monsters = Monster.where('name LIKE ?', "#{input}%").map{|monster| monster.name}.sort
                break
            when '2' || '2.'
                puts 'What is your search criteria?'
                input = gets.chomp.downcase
                monsters = Monster.where('name LIKE ?', "%#{input}%").map{|monster| monster.name}.sort
                break
            when '3' || '3.'
                puts 'What is your search criteria?'
                input = gets.chomp.downcase
                monsters = Monster.where('name LIKE ?', "%#{input}").map{|monster| monster.name}.sort
                break
            else 
                puts "That is not a valid input."
            end
        end
        puts ''
        puts "The monsters matching #{input} are:".green
        sleep(1)
        puts_with_delay(monsters, 0.05)
        sleep(1)
    end

    def puts_with_delay(string_array, sleep_t, limit = nil)
        count = 0.0
        string_array.each{|string|
        sleep(sleep_t)
        puts string
        count += 1
        if count == limit
            while true
                puts "Do you want to continue the list? (Y/N)"
                input = gets.chomp.downcase
                if input == 'y'
                    count = 0
                    break
                elsif input == 'n'
                    return
                else
                    puts 'That is not a valid input.'
                end
            end
        end

    }
    end
#Location Menu ABOVE^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
##############################################################################################################



#Story Menu BELOW 
##############################################################################################################
##############################################################################################################


def story_menu_test
    @user = User.second
    @story = Story.third
    story_menu
end 

def story_menu
    puts "Hi there! Welcome to '#{@story.story_name}'!"
    puts "What do you want to do next? (Please enter the number.)"
    puts <<-HEREDOC
     1. See the list of Worlds in your story
     2. Return to main-menu
   
     
    HEREDOC

    input = gets.chomp
    case input
    when '1'
        puts "List of the Worlds in #{input}" 
        puts @story.worlds.map{|world| world.name}
        puts ""
        puts "Enter a world to see it's locations.(Enter the name of a world.)"
        input = gets.chomp
        @world = World.find_by(name: input)
        while (!@world)
            puts "Oops! Invalid choice. Please enter again!"
            input = gets.chomp
            @world = World.find_by(name: input)
        end ###while loop
        puts ""
        puts "Locations in #{@world.name}:"
        puts @world.locations.map{|location| location.name} 
        puts ""
        puts <<-HEREDOC
        What's next?
        1. Choose a location
        2. Add a world
        3. Delete a world
        4. Return
        HEREDOC

        while true
            input = gets.chomp
            case input
            when '1'
                loc_input = gets.chomp
                @location = @world.locations.find{|loc|
                    loc.name == loc_input
                }
                if @location == nil
                    puts "This location does not exist"
                else
                    location_menu
                end
                break
            when '2'
                break
            when '3'
                break
            when '4'
                break
            else 
                puts 'That is not a valid input'
            end
            end
    when '2'
        @story = nil
        @world = nil
         main_menu
    else
    puts "Oops! invalid option! Please choose between 1 to 2"
    input = gets.chomp
    end ## if else
    
end ###story_menu
   


# # def story_menu_test
    # #     @user = User.second
    # #     @story = Story.third
    # #     story_menu
    # # end 

    # def story_menu
    #     first_prompt
    #     input = gets.chomp
    #     @world = World.find_by(name: input)
    #     while (!@world)
    #         puts "Invalid choice. Please enter again!"
    #         input = gets.chomp
    #         @world = World.find_by(name: input)
    #     end
        
    #     puts "Locations in this world!"
    #     puts @world.locations.map{|location| location.name} 

        
    #     puts "Choose a location!"
    #     # location_menu  
    # end 
    # private 
    # def first_prompt
    #     puts "Welcome to your Story!"
    #     puts "Your story name '#{@story.story_name}'"
    #     puts "Worlds in '#{@story.story_name}':" 
    #     puts @story.worlds.map{|world| world.name}
    #     puts ""
    #     puts "Which world do you want to conquer?"
    # end 

       
  ###################GGGGGGG############################ 
end