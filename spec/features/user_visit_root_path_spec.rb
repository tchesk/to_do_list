require 'rails_helper'

feature 'user visit home page' do
  scenario 'successfuly' do
    visit root_path

    expect(page).to have_css('h1', text: 'To do list')
    expect(page).to have_css('p', text: 'Bem-vindo ao maior lista de tarefas online')
  end
  scenario 'and view a public list' do
    list = PublicTask.create(task_description: 'regar as plantas da horta')
    list_1 = PublicTask.create(task_description: 'colheita de frutas maduras')

    visit root_path
    visit public_task_index_path

    expect(page).to have_css('h1', text: 'Lista de tarefas pública')
    expect(page).to have_css('li', text: list.task_description)
    expect(page).to have_css('li', text: list_1.task_description)
  end
end
