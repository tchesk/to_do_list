require 'rails_helper'

feature 'create a new task' do
  scenario 'add a new task into task list' do
    user = User.create(email: 'pedro@autoseg.com.br', password:'123456')
    task_list = TaskList.create(title: 'Cuidar da horta', public_list: true,
                                user: user
    )
    visit root_path

    click_on 'log in'
    fill_in 'Email', with:'pedro@autoseg.com.br'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    click_on task_list.title
    click_on 'Adicionar nova tarefa'

    fill_in 'Título', with: 'Regar plantas'
    fill_in 'Comentário', with: 'horta comunitária'
    click_on 'Salvar'

    expect(page).to have_css('h3', text: 'Regar plantas')
    expect(page).to have_css('h4', text: 'horta comunitária')
    expect(page).to have_link('Adicionar nova tarefa')
    expect(page).to have_link('Ver todas as listas')
  end

  scenario 'login and click on task list' do
    user = User.create(email: 'pedro@autoseg.com.br', password:'123456')
    task_list = TaskList.create(title: 'Cuidar da horta', public_list: true,
                                user: user
    )
    task = Task.create(title: 'regar as plantas',
                       description:'horta comunitária', task_list: task_list
    )

    visit root_path

    click_on 'log in'
    fill_in 'Email', with:'pedro@autoseg.com.br'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    click_on task_list.title

    expect(page).to have_css('h3', text: task.title)
    expect(page).to have_css('h4', text: task.description)
    expect(page).to have_link('Home')
    expect(page).to have_link('Ver todas as listas')
    expect(page).to have_link('Sair')
  end
end
