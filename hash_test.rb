require 'minitest/autorun'
require 'json'
require_relative 'hash.rb'

class TestMyDropdown < Minitest::Test

    EXPOSURES = {"exposure_area"=> {"Felling"=> {"Hazard Lists"=> {"Logger Hazards"=> {"Hazards"=> {"N/A"=> {"Interventions"=> ["Hard hat being worn","Hard hat being worn properly","Hard hat is ANSI approved","N/A"]}}}}},"Felling1"=> {"Hazard Lists"=> {"Logger Hazards1"=> {"Hazards"=> {"N/A1"=> {"Interventions"=> ["Hard hat being worn","Hard hat being worn properly","Hard hat is ANSI approved","N/A"]}}}}}}}

    # def test_data_structure
    #     data = JSON.parse(File.read('public/testJson.json'))
    #     exp_data = EXPOSURES
    #     assert_equal(exp_data, data)
    # end

    # def test_return_subMenu_list
    #     dropdown_creator = DropdownCreator.new(EXPOSURES)
    #     assert_equal(["Felling", "Felling1"], dropdown_creator.get_subMenu_list()) 
    # end

    # def test_return_subMenu2_list
    #     dropdown_creator = DropdownCreator.new(EXPOSURES)
    #     subMenu = ["Felling", "Felling1"]
    #     assert_equal({"Felling"=>["Logger Hazards"], "Felling1"=>["Logger Hazards1"]}, dropdown_creator.get_subMenu_list()) 
    # end

    # def test_return_subMenu3_list
    #     dropdown_creator = DropdownCreator.new(EXPOSURES)
    #     subMenu2 = {"Felling"=>["Logger Hazards"], "Felling1"=>["Logger Hazards1"]}
    #     assert_equal({"Logger Hazards"=>["N/A"], "Logger Hazards1"=>["N/A1"]}, dropdown_creator.get_subMenu_list()) 
    # end

    def test_return_interventions_list
        data = JSON.parse(File.read('public/exposuresTest.json'))
        dropdown_creator = DropdownCreator.new(data)
        subMenu3 = {"Logger Hazards"=>["N/A"], "Logger Hazards1"=>["N/A1"]}
        assert_equal([{"Logger Hazards"=>["Hard hat being worn", "Hard hat being worn properly", "Hard hat is ANSI approved", "N/A"]}, {"N/A1"=> ["Hard hat being worn","Hard hat being worn properly","Hard hat is ANSI approved","N/A"]}], dropdown_creator.get_subMenu_list()) 
    end
end