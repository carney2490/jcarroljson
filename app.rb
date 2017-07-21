require 'sinatra'
require 'json'

require_relative 'hash.rb'

get '/' do
    redirect '/index'
end

get '/index' do
    data = JSON.parse(File.read('public/setup.json'))
    companies = data["companies"]
    exposures = data["exposure_area"]
    management = data["program_management"]
    drop = DropdownCreator.new(exposures)
    dropdownArray = drop.get_subMenu_list
    subMenu = dropdownArray[0]
    subMenu2 = dropdownArray[1]
    subMenu3 = dropdownArray[2]
    interventions = dropdownArray[3]
    erb :index, locals: {subMenu: subMenu, subMenu2: subMenu2, subMenu3: subMenu3, interventions: interventions, companies: companies, management: management}
end