require 'pry'
def consolidate_cart(cart)
  # code here
  new_cart = {}
  cart.each do |hash|
    hash.each do |name, describe|
      if new_cart[name]
        new_cart[name][:count] += 1

      else
        new_cart[name] = describe
        new_cart[name][:count] = 1

      end
    end
  end
  new_cart

end


def apply_coupons(cart, coupons)



end

# def apply_clearance(cart)
#   # new_cart = cart
#   # cart.each do |name, hash|
#   #     if hash[:clearance] #if clearance is true, take 20% off
#   #       new_cart[name][:price] = (cart[name][:price] * 0.8).round(2)
#   #     end
#   # end
#   # new_cart #if not, just return the same cart
# end

# def checkout(cart, coupons)
#   # code here
# end
