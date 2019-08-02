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
  new_cart

end


def apply_coupons(cart, coupons)



end

def apply_clearance(cart)
  # code here
  discount = 0.80
  cart.each do |item, details|

    if cart[details][:clearance] == true
      cart[details][:price] = (cart[details][:price]*discount).round(1)
    end
  end
  cart
  binding.pry
end

def checkout(cart, coupons)
  # code here
end
