module ApplicationHelper
  
  def title
    base_title = "The College Project"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def stylized_flash(key)
    case key
      when :alert
        "warning"
      when :error
        "error"
      when :notice
        "info"
      when :success
        "success"
      else
        key.to_s
    end
  end
  
  def google_map_static_image_for(geo_object, xsize=450, ysize=300, zoom=16)
    image_tag("http://maps.google.com/maps/api/staticmap?size=#{xsize}x#{ysize}&sensor=false&zoom=#{zoom}&markers=#{geo_object.latitude}%2C#{geo_object.longitude}")
  end
  
  def communities_tagline(object)
    community_list = Array.new
    object.communities.each do |community|
      community_list.push(community.name)
    end
    return community_list.to_sentence(:last_word_connector => ", ", :two_words_connector => ", ")
      
  end
  
  def profile_address_formatted(profile)

     address_string = [profile.street1, profile.street2].to_sentence(:two_words_connector => "<br />") + profile.city + ", " + profile.state + " " + profile.zip + "<br />" + profile.country
     return address_string.html_safe
   end
  

  
end
