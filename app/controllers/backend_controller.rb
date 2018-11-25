class BackendController < ApplicationController

  # before_action :webInit, only: [:stats]
  # before_action :updateStatic, only: [:stats]
  # before_action :updateActive, only: [:stats]

  def lookup
  end

  def update
  end

  def stats
  end

  private
  def webInit
    # https://github.com/izetex/web3-eth
    web3 = Web3::Eth::Rpc.new host: 'mainnet.infura.io', port: 443,  
      connect_options: { 
        open_timeout: 20, 
        read_timeout: 140, 
        use_ssl: true, 
        rpc_path: '/d5aecbd9fc684900afb3d6d61d7f3c98' 
      }

    vendABI = JSON.parse('[{"constant":true,"inputs":[],"name":"available","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"amountRaised","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"CloseVending","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"price","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"claimFunding","outputs":[],"payable":false,"type":"function"},{"inputs":[{"name":"holdingAddress","type":"address"},{"name":"token","type":"address"},{"name":"budget","type":"uint256"},{"name":"rate","type":"uint256"}],"payable":false,"type":"constructor"},{"payable":true,"type":"fallback"}]')
    cardABI = JSON.parse('[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"standard","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"description","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"target","type":"address"},{"name":"mintedAmount","type":"uint256"}],"name":"mintToken","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"ipfs_hash","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"desc","type":"string"}],"name":"setDescription","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"isLocked","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"},{"name":"_extraData","type":"bytes"}],"name":"approveAndCall","outputs":[{"name":"success","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"},{"name":"","type":"address"}],"name":"allowance","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"lock","outputs":[],"payable":false,"type":"function"},{"inputs":[{"name":"initialSupply","type":"uint256"},{"name":"tokenName","type":"string"},{"name":"tokenSymbol","type":"string"},{"name":"tokenDescription","type":"string"},{"name":"ipfsHash","type":"string"}],"payable":false,"type":"constructor"},{"payable":false,"type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}]')

    # Creation of contract object
    @vendContract = web3.eth.contract(vendABI)
    @cardContract = web3.eth.contract(cardABI)
  end

  def updateStatic 
    # Update what doesn't change often: IPFS and Vend price
    cards = Card.all
    @cardArray = []

    # Loop cards and initiate contract to each address
    # Fetch contract information and save to hash array
    cards.order(:id).each do |card|
      cardInstance = @cardContract.at(card.card_addr.to_s)
      hash = {}
      if card.vend_addr == nil
        puts card.id.to_s + ": nil vend"
        hash = { 
          :card_id => card.id,
          :card_ipfs => cardInstance.ipfs_hash().to_s,
          :vend_price => 0
        }
      else
        puts card.id.to_s + ": not nil"
        vendInstance = @vendContract.at(card.vend_addr.to_s)
        hash = { 
          :card_id => card.id,
          :card_ipfs => cardInstance.ipfs_hash().to_s,
          :vend_price => vendInstance.price().to_i/1.0e18
        }
      end
      @cardArray.push(hash)
    end

    # Update the fetched information into the db
    @cardArray.each do |c|
      puts "Saving #" + c[:card_id].to_s
      card = Card.find_by(id: c[:card_id])
      card.update(ipfs: c[:card_ipfs])
      card.update(vend_price: c[:vend_price])
    end
  end

  def updateActive
    # Update what changes often: Vend supply
    cards = Card.all
    @cardArray = []

    # Loop cards and initiate contract to each address
    # Fetch contract information and save to hash array
    cards.order(:id).each do |card|
      cardInstance = @cardContract.at(card.card_addr.to_s)
      hash = {}
      if card.vend_addr == nil
        puts card.id.to_s + ": nil vend"
        hash = { 
          :card_id => card.id,
          :vend_supply => 0
        }
      else
        puts card.id.to_s + ": not nil"
        vendInstance = @vendContract.at(card.vend_addr.to_s)
        hash = { 
          :card_id => card.id,
          :vend_supply => vendInstance.available().to_i #remaining_supply
        }
      end
      @cardArray.push(hash)
    end

    # Update the fetched information into the db
    @cardArray.each do |c|
      puts "Saving #" + c[:card_id].to_s
      card = Card.find_by(id: c[:card_id])
      card.update(remaining_supply: c[:vend_supply])
    end
  end

    # "https://ipfs.io/ipfs/"+ipfsHash;
    # Do all cards have the total supply info in the db?

end
