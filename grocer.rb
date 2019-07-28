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

    cart_with_coupons = cart
    i = 0
    
    while i < coupons.length do
      use_coupon = nil
      coupons_clearance = nil
      coupons_hash = coupons[i]
      coupons_cost = coupons_hash[:cost]
      coupons_item = coupons_hash[:item]
      coupons_num = coupons_hash[:num]
      item_count = nil
      
      cart.each do |key, value|
          item_count = cart_with_coupons[key][:count]
          if coupons_item == key && cart_with_coupons[key][:count] >= coupons_num
            use_coupon = true
            coupons_clearance = cart[key][:clearance]
            cart_with_coupons[key][:count] -= coupons_num 
          end
      end
      if (use_coupon) && (cart_with_coupons["#{coupons_item} W/COUPON"]) && (item_count >= coupons_num)
        cart_with_coupons["#{coupons_item} W/COUPON"][:count] += coupons_num
      elsif use_coupon 
        cart_with_coupons["#{coupons_item} W/COUPON"] = {:price => (coupons_cost/coupons_num), :clearance => coupons_clearance, :count => coupons_num}
      end
      i += 1
    end
  return cart_with_coupons
end	




# def apply_coupons(cart, coupons)
#   newhash = cart 
#   coupon_list = {}
#   cart.each {|key, value|
#   i = 0 
  
#   while i < coupons.length do
#     if (coupons[counter][:item] == key) && (coupons[counter][:num]) <= newhash[key][:count]
      
#       newhash[key][:count] -= coupons[counter][:num] 
      
#       if coupon_list["#{key} W/ COUPON"]
#           coupon_list["#{key} W/ COUPON"][:count] += coupons[counter][:num]
#       else 
#         coupon_list["#{key} W/ COUPON"] = {:price => coupons[counter][:cost]/coupons[counter][:num], :clearance => newhash[key][:clearance], :count => coupons[counter][:num]}
#       end
#     end
#     counter += 1 
#   end
#   }
#   newhash.merge(coupon_list)
# end











def apply_clearance(cart)
 if cart[:clearance] = true 
end


def checkout(cart, coupons)
  
end
