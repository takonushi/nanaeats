require 'rails_helper'

RSpec.describe 'schedules/new', type: :view do
  before(:each) do
    assign(:schedule, Schedule.new(
                        name: 'MyString'
                      ))
  end

  it 'renders new schedule form' do
    render

    assert_select 'form[action=?][method=?]', schedules_path, 'post' do
      assert_select 'input[name=?]', 'schedule[name]'
    end
  end
end
