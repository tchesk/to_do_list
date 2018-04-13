require 'rails_helper'

feature 'user visit home page' do
  scenario 'successfuly' do
    visit root_path

    expect(page).to have_css('h1', text: 'To do list')
    expect(page).to have_css('p', text: 'Bem-vindo ao maior lista de tarefas online')
  end
  scenario 'and view a public list' do
    list = Task.create(title: 'regar as plantas',description:'horta comunitária')
    list_1 = Task.create(title: 'colheita de fruta', description:'somente maduras')

    visit root_path

    expect(page).to have_css('h3', text: 'Tarefas')
    expect(page).to have_css('li', text: list.title)
    expect(page).to have_css('li', text: list.description)
    expect(page).to have_css('li', text: list_1.title)
    expect(page).to have_css('li', text: list_1.description)
  end
end
