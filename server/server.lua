ESX = nil
local cache = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('eyss_menu:getPlayerName', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nameofplayer

    playername = MySQL.query.await("SELECT firstname, lastname FROM users WHERE identifier = ?",{xPlayer.identifier})[1]
    if playername~=nil then playername = playername~=nil and playername or {firstname="N/A",lastname="N/A"} end
    nameofplayer = playername.firstname.." "..playername.lastname or "Votre nom complet n'est pas charger"

    cb(nameofplayer)
end)

ESX.RegisterServerCallback('eyss_menu:getPhoneNumber', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local phonenumber

  number = MySQL.scalar("SELECT phone_number FROM users WHERE identifier = ?",{xPlayer.identifier})[1]
  if number~=nil then number = number~=nil and number or {phone_number="N/A"} end
  phonenumber = number.phone_number or "Your phone number is invalid"

  cb(phonenumber)
end)

ESX.RegisterServerCallback('eyss_menu:getCash', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local cash

  cash = xPlayer.getMoney()

  cb(cash)
end)

ESX.RegisterServerCallback('eyss_menu:getBank', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local bank

  bank = xPlayer.getAccount('bank').money

  cb(bank)
end)


if GetCurrentResourceName() ~= "eyss_menu" then
  print("Erreur: Remplacez le nom de la ressource par \"eyss_menu\" ou ça ne marchera pas !")
end

print("[^1EYSS_MENU^0] : ^5Lancement reussi !^0")