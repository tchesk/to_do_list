require 'rails_helper'

feature 'user create a new task list ' do
  scenario 'successfuly' do
    task_list = TaskList.create(title:'Cuidar da horta', public: true)
    task_list_1 = TaskList.create(title:'Treinar futvolei', public: false)

    visit root_path
    click_on 'lista de tarefas'

    expect(page).to have_css('h1', text: 'Lista de tarefas')
    expect(page).to have_css('li', text: task_list.title)
    expect(page).to have_css('li', text: task_list_1.title)
  end
end
