require "pry"
class CashRegister

    attr_accessor :discount, :total, :items

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @all_prices = []
        @last_trans_q = []
    end

    def add_item(title, price, quantity = 1)
        if quantity > 1
            quantity.times do
                @items << title
                @total += price
                @all_prices << price
                @last_trans_q << quantity
            end
        else
            @items << title
            @total += price
            @all_prices << price
            @last_trans_q << quantity
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            new_price = @total -= @total *@discount / 100
            "After the discount, the total comes to $#{new_price}."
        end
    end

    def void_last_transaction
        @total -= @all_prices.last * @last_trans_q.last
    end



end