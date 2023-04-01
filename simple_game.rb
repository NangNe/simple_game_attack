require 'byebug'
class Player
    attr_accessor :health, :attack_power, :skill
    def initialize(health, attack_power, skill)
        @health = health
        @attack_power = attack_power
        @skill = skill
    end

    def attack(enemy, skill_index)
        # byebug
        skills = @skill[skill_index]
        
        damage = rand(50..@attack_power) + skills
        puts "Player attacks with #{damage} damage"
        enemy.take_damage(damage)
      
    end
    def take_damage(damage)
        @health = @health - damage       
        puts "Player nhận #{damage} damage"
        puts "Player còn #{@health} health "
    end

    def check_die
        @health > 0
    end
end


class Enemy
    attr_accessor :health, :attack_power, :skill
    def initialize(health, attack_power, skill)
        @health = health
        @attack_power = attack_power
        @skill = skill
    end
    def attack(player)
        # byebug
        damage = rand(0..@attack_power) + rand(0..skill)
        puts "Enemy attacks with #{damage} damage"
        player.take_damage(damage)
    end
    
    def take_damage(damage)
        @health = @health - damage
        puts "Enemy nhận #{damage} damage"
        puts "Enemy còn #{@health} health "
    end

    def check_die
        @health > 0
    end
end

class Game
    $player = $player || Player.new(rand(50..200), rand(50..100), [5,10,15])
    $enemy = $enemy || Enemy.new(rand(50..200), rand(5..50), 50)
        
        # enemy = Enemy.new(rand(50..100), rand(50..100), rand(0..10))        
    
    def start
     
        puts $player.health

        puts $enemy.health
        while $player.check_die && $enemy.check_die
            puts "Player has #{$player.health} health , has #{$player.attack_power} attack and has #{$player.skill} skill"
            puts "Enemy has #{$enemy.health} health, has #{$enemy.attack_power} attack and has #{$enemy.skill} skill"
            puts "Select a skill to use:"
            puts "1. "
            puts "2. "
            puts "3. "
            skill_index = gets.chomp.to_i - 1
            $player.attack($enemy,skill_index)
            $enemy.attack($player)
        end

        if $enemy.check_die
            puts "Enemy wins!"
          else
            puts "Player wins!"
        end
    end
end

game = Game.new
game.start
# Vòng lặp người chơi tấn công trước rồi tới enemy cho tới khi health <0


# Kiểm tra health ?

    