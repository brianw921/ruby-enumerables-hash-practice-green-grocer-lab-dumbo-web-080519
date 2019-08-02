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


# def apply_coupons(cart, coupons)
#
#
#
# end
def apply_coupons(cart, coupons)
  #doesn't break if there is no coupon
  return cart if coupons == []

  #set new_cart = cart so we don't have to push all the values, just change them
  new_cart = cart
  coupons.each do |coupon|
    name = coupon[:item] #avocado, cheese,...
    coupon_num = coupon[:num]
    #if the cart has the same item in coupon and has larger amount than in coupon
    if cart.include?(name) && cart[name][:count] >= coupon_num
       #remove number of the new_cart's count
       new_cart[name][:count] -= coupon_num
       #increase the count when there is more items than the coupon allows
       if new_cart["#{name} W/COUPON"]
         new_cart["#{name} W/COUPON"][:count] += 1
       #set the name with coupon with new value
       else
         new_cart["#{name} W/COUPON"] = {
           :price => coupon[:cost],
           :clearance => new_cart[name][:clearance],
           :count => 1
         }
       end
     end
   end
   new_cart
   
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
