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

def apply_clearance(cart)
  new_cart = cart
  cart.each do |name, hash|
      if hash[:clearance]
        new_cart[name][:price] = (cart[name][:price] * 0.8).round(1)
      end
  end
  new_cart
end

# def checkout(cart, coupons)
#   # code here
# end
def checkout(cart, coupons)
  #call the consolidate to get the count item first
  new_cart = consolidate_cart(cart)
  #apply coupon to the new cart
  apply_coupons(new_cart, coupons)
  #apply clearance after discount from coupon
  apply_clearance(new_cart)

total = 0
  new_cart.each do |name, hash|
    total += (hash[:price] * hash[:count])
  end

if total >= 100
    total *= 0.9
  end

  total
end

