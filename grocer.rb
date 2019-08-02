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
  return cart if coupons == []
  new_cart = cart
  coupons.each do |coupon|
    name = coupon[:item]
    coupon_num = coupon[:num]
    coupon_cost = coupon[:cost]
    if cart.include?(name) && cart[name][:count] >= coupon_num

       new_cart[name][:count] -= coupon_num
       if new_cart["#{name} W/COUPON"]
         new_cart["#{name} W/COUPON"][:price] = coupon_cost / coupon_num
         new_cart["#{name} W/COUPON"][:count] += coupon_num
        binding.pry
       else
         new_cart["#{name} W/COUPON"] = {
           :price => coupon[:cost],
           :clearance => new_cart[name][:clearance],
           :count => 1}
       end
     end
   end

   new_cart
    binding.pry
end
