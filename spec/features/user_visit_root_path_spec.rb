require 'rails_helper'

feature 'user visit home page' do
  scenario 'and log in' do
    user = User.create(email:'pedro@autoseg.com', password:'123456')

    visit root_path

    click_on 'Sign up'
    click_on 'Log in'

    fill_in 'Email', with:'pedro@autoseg.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).to have_css('h1', text: 'Lista de Tarefas')
    expect(page).to have_css('p', text: 'Bem-vindo ao maior lista de tarefas online')
  end

  scenario 'and view a public list' do
    user = User.create(email:'pedro@autoseg.com', password:'123456')
    task_list = TaskList.create(title:'Cuidar da horta', public_list: true, user: user)
    list = Task.create(title: 'regar as plantas',
                       description:'horta comunitária', task_list: task_list
    )
    list_1 = Task.create(title: 'colheita de fruta',
                         description:'somente maduras', task_list: task_list
    )

    visit root_path

    click_on 'Sign up'
    click_on 'Log in'

    fill_in 'Email', with:'pedro@autoseg.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).to have_css('li', text: task_list.title)
  end
end
