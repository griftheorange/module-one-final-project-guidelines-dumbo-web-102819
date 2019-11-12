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
end