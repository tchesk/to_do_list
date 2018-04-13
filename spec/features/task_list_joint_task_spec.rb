require 'rails_helper'

feature 'user create a task list' do
  scenario 'and access a specific task' do
    task_list = TaskList.create(title:'Cuidar da horta', public: true)
    task_list_1 = TaskList.create(title:'Treinar futvolei', public: false)

    task = Task.create(title: 'regar as plantas',
                       description: 'horta comunitária', task_list: task_list
    )
    task_1 = Task.create(title:'Aquecimento',
                         description:'correr em volta da quadra'
    )

    visit task_list_index_path
    click_on task_list.title

    expect(page).to have_css('h3', text: task_list.title)
    expect(page).to have_css('h5', text: task.title)
    expect(page).to have_css('p', text: task.description)
  end
end
