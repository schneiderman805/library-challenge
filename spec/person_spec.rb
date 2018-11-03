require './lib/person.rb'

describe Person do

    it 'every customer has a user_id and a pin_code' do
        expect(subject.user_id).not_to be nil
        expect(subject.pin_code).not_to be nil
    end

    it 'every customer has empty book list when created' do 
        expect(subject.reading_list).to be_empty
    end

    # As an individual
    # In order to avoid awkward moments at the library
    # I would like to know when my book is supposed to be returned

    it 'shows list of titles and return dates in my reading list' do
        reading_list =[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=> '2018-10-03'}]
        expected_output = [["Alfons och soldatpappan",'2018-10-03']]
        expect(subject.reading_list_return_dates(reading_list)).to eq expected_output
    end

    it 'every costomer gets a warning when due date has passed' do
        reading_list =[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=> '2018-10-03'}]
        warning = ["Alfons och soldatpappan" ]
        expect(subject.check_due_date(reading_list)).to eq warning
    end

end