class RestaurantUser < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    has_many :commands

    ROLES = ["CLIENTE", "CAMARERO", "COCINERO", "GERENTE"]

    def discount
        total = 0
        self.commands.map {|c| total += c.command_price}

        if total > 1000
            return 1
        elsif total > 2500
            return 2
        elsif total > 5000
            return 3
        elsif total > 10000
            return 4
        else
            return 0
        end
    end

    def totalPrice
        total = 0
        self.commands.map {|c| total += c.command_price}

        return total
    end
end
