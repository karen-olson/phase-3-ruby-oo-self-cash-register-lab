require 'pry'

class CashRegister
    attr_accessor :items, :total, :discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times { @items << title }
        # self.last_transaction = {title: title, price: price, quantity: quantity}
        # self.total += price * quantity
        self.last_transaction = price * quantity
        self.total += self.last_transaction
    end

    def apply_discount
        if self.discount != 0 
            discount_as_percent = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_as_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items 
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end
