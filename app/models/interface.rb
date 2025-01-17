
class Interface
    # attr_reader :user, :stories

#LOGIN SCREEN BELOW 
##############################################################################################################
##############################################################################################################

    def login
        @print_pause = 0.005
        system "afplay config/music/Tavern.mp3 &"
        music_menu
        system "clear"
        pic =  <<-HEREDOC
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
        pic = pic.gsub('0', '0'.white)
        pic = pic.gsub('1', '1'.black)
        img = pic.split("\n")
        puts_with_delay(img, 0.05)

        while true
            puts "Welcome to DM Log 1.01.00!"
            puts "By: Griffin Poole, Imade Osifo, Guligena Aierken"
            puts "Please give us your username! (Q to quit)"
            input = gets.chomp
    
            # puts "TESTING Inputs #{input}"
            if input.upcase == 'Q'
                system 'killall afplay'
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
    end

    def new_user_prompt(name)
        puts "I don't recognize that username. Would you like to make a new user? (Y/N)"
        input = gets.chomp.downcase

        case input
        when 'y'
            @user = User.find_or_create_by(username: name)
            main_menu
        when 'n'
            return
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
        puts "~~~ Welcome #{@user.username} to the Main Menu ~~~\n\n" 
        puts "{1} Continue from previous story "
        puts "{2} Create new story"
        puts "{3} Delete a story"
        puts "{4} Tutorial"
        puts "{5} End My Session"
end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

        
def prev_story_screen
    system "clear"
    count = 1

        puts "~~~ Welcome back to your story logs!!! ~~~"  
        my_stories = @user.stories.each do |story| 
            puts "{#{count}} #{story.story_name}"
            count += 1
        end

        while true
            print "\n\nWhich adventure would you like to pick up? (press 'R' to return) ==> "
            input = gets.chomp
            if input == 'R' || input == 'r'
                main_menu
            end
            input = input.to_i
            if input > count-1 || input < 1
                puts "That is not a valid input"
                sleep(1)
            else
                selected_story = my_stories[input-1]
                @story = selected_story
                story_menu
            end
        end
end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

def create_story
    puts ''
    puts 'What is the name of your new story?'
    input = gets.chomp
    s = Story.find_or_create_by(story_name: input, user_id: @user.id)
    @user = User.find(@user.id)
    puts ''
    puts "You have created the story #{s.story_name}"
    sleep(1)
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

    def delete_story 
        system "clear"
        count = 1

        puts "~~~ Welcome to the Delete Story Menu ~~~"  
        my_stories = @user.stories.each do |story| 
            puts "{#{count}} #{story.story_name}"
            count += 1
        end
        puts "{#{count}} Return to Main Menu" 

        while true
            print "\n\n Which story will you nuke today? ==>  "
            input1 = gets.chomp
            if input1 == '0'
                input = 0
            elsif input1.to_i == 0
                puts "That is not a valid input."
                input1 = count
                sleep(1)
            else
                input1 = input1.to_i
            end
            main_menu if input1 >= count 
            puts "You have destroyed #{@user.stories[input1-1].story_name}"
            @user.stories[input1-1].destroy
            @user = User.find(@user.id)
            sleep(1)
            break
        end

        # while !Story.find_by(story_name: selected_story)
        #     puts "Please enter a number for a valid story ==> "

        #     if Story.find_by(story_name: selected_story)
        #         puts "Are you sure you want to destroy all these babies? (Y/N) => "
        #              input2 = gets.chomp.upcase 

        #         case input2 
        #         when 'Y'
                    
        #             puts "Story #{story_no_more.story_name} has been deleted!"
        #             puts "Press any key to return to continue...."
        #             Story.all.delete(story_no_more)
        #                   input3 = gets.chomp 
        #                   if input3 
        #                     delete_story 
        #                   end 
        #         when 'N'
        #             delete_story
        #         end 
        #     end 
        # end 

    end 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Menu OPTION 4 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

def  tutorial

    system "clear"
        count = 1
  
        puts "~~~~~ Welcome to the Tutorial for MyFirstDnD!!! ~~~~~" 
        puts "\t\tYour New World Awaits" 
        puts "\n\nIn this app you are the all powerful Dungeon Master!"
        puts "That means you have the ability to create a story as far as your vision will take you."
        puts "Your story, like any great tale, begins in your own world. And because you are the "
        puts "Dungeon Master or DM. It is up to you to create, destroy, or change as many locations and "
        puts "The possibilities are nearly endless so please don't let all this new power get to your head."
        puts "monsters in your world as you desire. The last guy who played thought he could run for president... and won"
        puts "\n\n\n~~~~~~ So let's get started!!! ~~~~~~~"

        print  "\nStep 1.) What is the name of your new story? ==> "
            input1 = gets.chomp
            t_story = Story.find_or_create_by(story_name: input1, user_id: @user.id)
        sleep(0.5)

         print  "\nStep 2.) Great! Now what's the name of the world your story takes place in? ==> "
            input2 = gets.chomp
            t_world = World.find_or_create_by(name: input2, story_id: t_story.id)
        sleep(0.5)

         print  "\nStep 3.) Nice! Remember, you can have as many locations in your world as you want. What's the name of your first one => "
            input3 = gets.chomp
            t_location = Location.find_or_create_by(name: input3, world_id: t_world.id)
        sleep(0.5)

        system "clear"
        puts "\nALRIGHT! YOU JUST CREATED THE STORY " + "#{input1}".green + "\nIN THE WORLD OF " + "#{input2}".green + " \nWITH THE FIRST LOCATION OF " + "#{input3}".green
        puts "\nHere comes the fun part... LETS ADD THE MONSTERS!!!"

        puts "In this app, once you're done creating the details of your vision you can fill any location with as many monsters from off of the FULL DnD catalog"

        puts "And trust me I mean FULL!! We filled this puppy with the entire 1000+ monster log with  every type, details, challenge rating, and more, at your disposal"
        puts "\nPress Enter..\n"
        gets
        puts "\nHere's a quick list of 5 random mosters within the catalog. "
        puts "Remember, in the app you can choose any monster you want but for now let's just pick one to get going\n\n"
        puts "\nPress Enter..\n"
        gets

        random_mons_print(5)
        
        while true
            
            print "\nPlease type the name of the monster you want to add ==> "
            input = gets.chomp.downcase

            mons = Monster.where("name LIKE ?", input)[0]
            if mons == nil 
                puts "That is not a valid monster. "
            else  
                LocationMonster.find_or_create_by(location_id: t_location.id, monster_id: mons.id)
                puts "\n\nAwesome! You have added " +"#{mons.name}".green + " to #{t_location.name}."
                sleep(1)
                puts "\nIn conclusion, within the app you can filter, select, and search the full extent of our monster database and even"
                puts "display it's details online! For the purposes of this tutorial this is a basic skeleton for you to start off with."
                puts "\nCongrats on completing THE TUTORIAL!!!".green 
                sleep(1)
                puts "Press enter to return to the Main Menu..."
                gets 
                @user = User.find(@user.id)
                return
            end  
        end


        # print ""
        # @user = User.find(@user.id)  
        # puts ''
        # puts "You have created the story #{s.story_name}"
        # sleep(1)
        # my_stories = @user.stories.each do |story| 
        #     puts "{#{count}} #{story.story_name}"
        #     count += 1
        # end
        # puts "{#{count}} Return to Main Menu" 

        # while true
        #     print "\n\n Which story will you nuke today? ==>  "
        #     input1 = gets.chomp.to_i
        #     main_menu if input1 == count 
        #     puts "You have destroyed #{@user.stories[input1-1].story_name}"
        #     @user.stories[input1-1].destroy
        #     @user = User.find(@user.id)
        #     sleep(1)
        #     break
        # end

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
            create_story
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
    
    def random_mons_print(num)
        mons = Monster.all.sample(num)
        string_array = []
        mons.each{|monster|
            string_array << 'Name: '.green + "#{monster.name.capitalize} " + "Type: ".green + "#{monster.monster_type.capitalize} " + "Challenge Rating: ".green + "#{monster.challenge_rating} " + "Alignment: ".green + "#{monster.alignment.capitalize}"
        }
        puts_with_delay(string_array, 0.3)
    end


    def music_menu
        system 'clear'
        puts "Please select your music."
        puts <<-HEREDOC
        1. Tavern
        2. Good Song 1
        3. Good Song 2, Electric Boogaloo
        4. Stop music
        5. Proceed
        HEREDOC
        puts ''
        while true
            input = gets.chomp
            if !(input.to_i >= 1 || input.to_i <= 5)
                puts ''
                puts "That is not a valid input."
                puts ''
                sleep(1)
            else
                case input
                when '1' || '1.'
                    system 'killall afplay'
                    system "afplay config/music/Tavern.mp3 &"
                when '2' || '2.'
                    system 'killall afplay'
                    system "afplay config/music/Egypt.mp3 &"
                when '3' || '3.'
                    system 'killall afplay'
                    system "afplay config/music/SeaShanty.mp3 &"
                when '4' || '4.'
                    system 'killall afplay'
                when '5' || '5.'
                    return
                end
            end
        end
    end


    def loc_men_test
        @user = User.first
        @story = Story.first
        @location = World.first.locations.first
        location_menu
    end

    #have @user, @story, @location, Locations main menu for interaction
    def location_menu
        @print_pause = 0.005
        @world = World.find(@location.world_id)
        system 'clear'
        while true
            puts ''
            puts "Story: #{@story.story_name}"
            puts "World: #{@world.name}"
            puts "Location: #{@location.name}"
            @monster_menu_doc =  <<-HEREDOC
            
    What would you like to do?
        1. See monster catalogue
        2. See all monster types
        3. Find monsters by type
        4. Find monsters by challenge rating
        5. Search monsters by name
        6. Get monster's details
        7. List monsters at this location
        8. List locations a monster shows up in in your story
        9. Add a monster to this location
        10. Remove a monster from this location
        11. Select random monster from this location
        12. Roll Dice d20
        13. Back to story
        14. Change Location's Name
        15. Main Menu
        HEREDOC

            puts @monster_menu_doc
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
                @world = nil
                story_menu

            when '14' || '14.'
                name = @location.name
                puts ''
                puts 'What you you like to change ' + "#{name}'s".green + " name to? (type 'wait stop' to return to menu)" 
                puts ""
                input = gets.chomp
                if input == 'wait stop'
                    next
                elsif @world.locations.map{|location| location.name}.include?(input)
                    puts "You can't change the name to a location that already exists in this world. Please try again."
                    next
                else
                    @location.update(name: input)
                    @location = Location.find(@location.id)
                    puts ""
                    puts "#{name}'s".green + " name has been changed to " + "#{@location.name}".green + '!'
                end

            when '15' || '15.'
                @story = nil
                @world = nil
                @location = nil
                main_menu
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
                important = ['name', 'size', 'challenge_rating', 'type', 'subtype','alignment', 'armor_class', 'hit_points', 'hit_dice', 'speed', 'strength', 'dexterity', 'constitution', 'intelligence', 'wisdom', 'charisma', 'perception', 'special_abilities', 'actions', 'legendary_actions']
                important.each{|topic|
                        if !['special_abilities', 'actions', 'legendary_actions'].include?(topic)
                            puts (topic.capitalize + ': ' + mons_hash[topic].to_s)
                        else
                            put_actions(mons_hash, topic)
                        end
                        sleep(0.1)
                }
                break
            when '2' || '2.'
                url = 'https://open5e.com/monsters/'
                name = mons_hash['name'].gsub(',', '').gsub("'", '').gsub('(', '').gsub(')', '').gsub(' ', '-').downcase
                url += name
                Launchy.open(url)
                break
            else
                'That is not a valid input.'
            end
        end
        
    end

    def put_actions(mons_hash, topic)
        puts ''
        puts "#{mons_hash['name']}'s #{topic.capitalize}:".green
        puts ''
        actions = mons_hash["#{topic}"]
        if actions.class != Array
            return
        else
            actions.each{|action|
                puts "Name: #{action['name']}".green
                puts action['desc']
                puts ''
                puts ''
                sleep(0.1)
            }
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



def story_menu
   while true
        sleep(1)
        puts ""
        puts ""
        puts "Hi there! Welcome to #{@story.story_name}!".bold.light_blue
        puts ""
        puts "What do you want to do next? (Please enter the number.)"
        puts ""
        puts <<-HEREDOC
         1. See the list of Worlds in your story
         2. Add a world
         3. Delete a world
         4. Return to main menu
        
        
        HEREDOC

            input = gets.chomp
            case input
            when '1'
                
                while true
                    puts ""
                    puts "List of the Worlds in #{@story.story_name}"
                    puts ""
                    puts @story.worlds.map{|world| world.name}
                    puts ""
                    puts "Enter the name of a world to see details or press 'R' to previous page.".yellow
               
                         world_input = gets.chomp
                        
                         if @story.worlds.map{|world| world.name}.include?(world_input)
                            @world = @story.worlds.find_by(name: world_input)
                            while (!@world)
                                puts ""
                                puts "Oops! Invalid choice. Please enter again!".red
                                puts ""
                                input = gets.chomp
                                @world = World.find_by(name: world_input)
                            end ###while loop
    ###############################location choices###################################
                            
                            while true
                            puts ""
                            puts "Locations in #{@world.name}:"
                            puts ""
                            puts @world.locations.map{|location| location.name} 
                            puts ""
                                puts <<-HEREDOC
                             What do you want to do next?
                              1. Access locations
                              2. Add a location
                              3. Delete a location
                              4. Return
                            HEREDOC
                            input = gets.chomp
                            case input
                            
                            when '1'
                               puts ""
                               puts "Which location do you want to enter? (To return, press R)".yellow
                               puts ""
                               puts @world.locations.map{|location| location.name} 

                            loc_input = gets.chomp
                         
                            if  @world.locations.all.map{|location| location.name}.include?(loc_input)
                                @location = @world.locations.find_by(name: loc_input)
                                sleep(1)
                                location_menu
                            elsif loc_input == 'R'
                                  puts ""
                            else
                                puts "Oops! Invalid option! Please enter again!".red
                                puts ""
                            end 
                           

                            when '2'
                            puts ""
                            puts "Which location do you want to add?".yellow
                                location_input = gets.chomp
                                location = Location.find_or_create_by(name: location_input, world_id: @world.id)
                                @world = World.find(@world.id)
                                puts ""
                                puts"Now you have #{location.name} in this world!".green
                                sleep(1)
                            when '3'
                                puts ""
                                puts "Which location do you want to delete?".yellow
                                    puts ""
                                    puts @world.locations.map{|location| location.name} 
                                    location_delete_input = gets.chomp
                                    
                                    if Location.where("name = ?", location_delete_input).empty?
                                        puts "Invalid entry! Please choose another one!".red
                                        puts ""
                                    else 
                                    l = Location.find_by(name: location_delete_input, world_id: @world.id)
                                    l.destroy
                                    puts ""
                                    puts "Now #{location_delete_input} is destroyed!".green
                                    @world = World.find(@world.id)
                                    sleep(1)
                                    
                                    end 
                            when '4'
                                @world = nil
                                story_menu
                            else  
                                puts "Oops! Invalid choice! Please enter again!".red
                                puts ""
                                sleep(1)
                            end 
                            end 
                       

    ###############################location choices###################################

                        elsif world_input == 'R'
                            puts ""
                            story_menu
                            
                        else 
                            puts "Oops! Invalid choice. Please enter again!".red
                            puts ""
                            sleep(1)
                        end 
                end
                      
            
    ###########add world
            when '2'
                puts ""
                puts "Which world do you want to add?".yellow
                world_input = gets.chomp
                world = World.find_or_create_by(name: world_input, story_id: @story.id)
                @story = Story.find(@story.id)
                puts ""
                puts"Now you have #{world.name} in this story!".green
                sleep(1)
                story_menu
    #################### delete world
            when '3'
                puts ""
                puts "Which world do you want to delete?".yellow
                    puts ""
                    puts @story.worlds.map{|world| world.name}
                    world_delete_input = gets.chomp
                    
                    if World.where("name = ?", world_delete_input).empty?
                        puts "Invalid entry! Please choose another one!".red
                        puts ""
                    else 
                    w = World.find_by(name: world_delete_input, story_id: @story.id)
                    w.destroy
                    puts ""
                    puts "Now #{world_delete_input} is destroyed!".green
                    @story = Story.find(@story.id)
                    sleep(1)
                    story_menu
                    end 
    
#################return to main menu
            when '4'
                @story=nil
                @world=nil
                 main_menu
            else 
                                                                                                           
                puts "OOPS! Invalid input! Please enter from 1 ~ 4!".red
                puts ""  
            
                sleep(2)
            end  ###case input first line                                                                                           
                                                                                                   
    end #while true                                                                       
       
end ###story_menu

   
  ###################GGGGGGG############################ 
end