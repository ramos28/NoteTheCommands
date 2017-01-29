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
        else
            return 0
        end
    end
end
