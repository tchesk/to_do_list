require 'rails_helper'

feature 'user create a task list' do
  scenario 'and access a specific task' do
    user = User.create(email:'pedro@autoseg.com', password:'123456')

    task_list = TaskList.create(title:'Cuidar da horta', public_list: true,
                                user: user
    )
    task_list_1 = TaskList.create(title:'Treinar futvolei', public_list: false,
                                  user: user
    )

    task = Task.create(title: 'regar as plantas',
                       description: 'horta comunitária', task_list: task_list
    )
    task_1 = Task.create(title:'Aquecimento',
                         description:'correr em volta da quadra'
    )

    visit root_path
    click_on 'log in'
    fill_in 'Email', with:'pedro@autoseg.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    visit task_lists_path

    expect(page).to have_css('h3', text: task_list.title)
  end
end
