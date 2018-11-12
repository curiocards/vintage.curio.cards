module ApplicationHelper

  def cardImage(card_id)
    # image_tag("/img/cards/#{id.to_s}.jpg")
    img_path = Rails.root.join("public/img/cards/").to_s
    
    # cards under 10 are named with a leading 0. Add the leading zero.
    if card_id < 10
      card_id = "0" + card_id.to_s
    elsif card_id >= 10
      card_id = card_id.to_s
    end
    
    if File.exists?("#{img_path}#{card_id}.jpg")
      return "/img/cards/#{card_id}.jpg"
    elsif File.exists?("#{img_path}#{card_id}.png")
      return "/img/cards/#{card_id}.png"
    elsif File.exists?("#{img_path}#{card_id}.gif")
      return "/img/cards/#{card_id}.gif"
    else
      return "" # returning nil errors out the page, link_to cant handle it
      # ToDo: check if it's a valid id in the db (there is no card 0, or card 1000, etc)
      # ToDo: try to return the cards https://ipfs location before doing ""
    end
  end
    
end