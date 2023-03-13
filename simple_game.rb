require 'byebug'
class Player
    attr_accessor :health, :attack_power
    def initialize(health, attack_power)
        @health = health
        @attack_power = attack_power
    end

    def attack(enemy)
        damage = rand(50..@attack_power)
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
    attr_accessor :health, :attack_power
    def initialize(health, attack_power)
        @health = health
        @attack_power = attack_power
    end
    def attack(player)
        damage = rand(50..@attack_power)
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

player = Player.new(rand(50..100), rand(50..100))
enemy = Enemy.new(rand(50..100), rand(50..100))

puts "Player has #{player.health} health and has #{player.attack_power} attack"
puts "Enemy has #{enemy.health} health and has #{enemy.attack_power} attack"

# Vòng lặp người chơi tấn công trước rồi tới enemy cho tới khi health <0
while player.check_die && enemy.check_die
  player.attack(enemy)
  enemy.attack(player)
end

# Kiểm tra health ?
if enemy.check_die
  puts "Enemy wins!"
else
  puts "Player wins!"
end
