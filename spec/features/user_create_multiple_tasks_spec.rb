require 'rails_helper'

feature 'create a task list ' do
  scenario 'show public list' do
    task_list = TaskList.create(title:'Cuidar da horta', public_list: true)
    task_list_1 = TaskList.create(title:'Treinar futvolei', public_list: false)

    task = Task.create(title: 'regar as plantas',
                       description:'horta comunitária', task_list: task_list
    )
    task_1 = Task.create(title:'Aquecimento',
                         description:'correr em volta da quadra')

    visit task_list_index_path

    expect(page).to have_css('h1', text: 'Tarefas')
    expect(page).to have_css('h3', text: task_list.title)
    expect(page).to have_css('h4', text: task.title)
    expect(page).to have_css('li', text: task.description)
  end
end
