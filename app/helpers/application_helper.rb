module ApplicationHelper

  def cardImage(card_id)
    # image_tag("/img/cards/#{id.to_s}.jpg")
    img_path = Rails.root.join("public/img/cards/").to_s
    card_id = card_id.to_s

    if File.exists?("#{img_path}#{card_id}.jpg")
      return "/img/cards/#{card_id}.jpg"
    elsif File.exists?("#{img_path}#{card_id}.png")
      return "/img/cards/#{card_id}.png"
    elsif File.exists?("#{img_path}#{card_id}.gif")
      return "/img/cards/#{card_id}.gif"
    # else
      # ToDo: return the cards https://ipfs location
    end
  end
    
end