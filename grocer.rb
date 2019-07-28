def consolidate_cart(cart)
  newcart = {}
  count = 0 
  
  cart.each do |element|
    element.each do |fruit, hash|
      newcart[fruit] ||= hash 
      newcart[fruit][:count] ||= 0 
      newcart[fruit][:count] += 1 
    end
  end
  return newcart
end




# def apply_coupons(cart, coupons)
#   return cart if coupons == []

#   newcart = cart

#   coupons.each do |coupon|
#     name = coupon[:item]
#     numberofcoupons = coupon[:num]
    
#     if cart.include?(name) && cart[name][:count] >= numberofcoupons newcart[name][:count] -= numberofcoupons
       
#       if newcart["#{name} W/COUPON"]
#         newcart["#{name} W/COUPON"][:count] += 1
         
#       else
#         newcart["#{name} W/COUPON"] = {
#           :price => coupon[:cost],
#           :clearance => newcart[name][:clearance],
#           :count => 1 
#         }
#       end
#     end
#   end
#   newcart
# end	

  




def apply_coupons(cart, coupons)
  newhash = cart 
  coupon_list = {}
  cart.each {|key, value|
  counter = 0 
  
  while coupons[counter] do
    if (coupons[counter][:item] == key) && (coupons[counter][:num]) <= newhash[key][:count]
      
      newhash[key][:count] -= coupons[counter][:num] 
      if coupon_list["#{key} W/ COUPON"]
        coupon_list["#{key} W/ COUPON"][:count] += coupons[counter][:num]
      else 
        coupon_list["#{key} W/ COUPON"] = {:price => coupons[counter][:cost]/coupons[counter][:num], :clearance => newhash[key][:clearance], :count => coupons[counter][:num]}
      end
    end
    counter += 1 
  end
  }
  newhash.merge(coupon_list)
end










def apply_clearance(cart)
 
end


def checkout(cart, coupons)
  
end
