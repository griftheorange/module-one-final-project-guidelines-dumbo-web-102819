class Interface
    # attr_reader :user, :stories


    def login
        system "clear"
        rasda = 'testnig'
        puts "Testing: #{rasda}"
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
| DEXTERITY                  [ ] [  ] |  | Successes               [ ] [ ] [ ] |
| Saving Throws              [ ] [  ] |  | Failures                [ ] [ ] [ ] |
| Acrobatics                 [ ] [  ] |  +-------------------------------------+
| Sleight of Hand            [ ] [  ] |  +-Other Proficiencies & Languages-----+
| Stealth                    [ ] [  ] |  |                                     |
+-------------------------------------+  |                                     |
| CONSTITUTION               [ ] [  ] |  |                                     |
| Saving Throws              [ ] [  ] |  |                                     |
+-------------------------------------+  |                                     |
| INTELLIGENCE               [ ] [  ] |  |                                     |
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

    def story_menu 
         system "clear"
         puts "Welcome to the story creator!!!"
    end
    
    

end