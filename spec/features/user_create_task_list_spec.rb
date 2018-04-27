require 'rails_helper'

feature 'user create a new task list ' do
  scenario 'successfuly' do
    user = User.create(email:'pedro@autoseg.com', password:'123456')

    visit root_path

    click_on 'log in'
    fill_in 'Email', with:'pedro@autoseg.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    click_on 'Criar nova lista'

    fill_in 'Título', with:'Cuidar da horta'
    select('Sim', from: 'Lista Pública')
    click_on 'Enviar'

    expect(page).to have_css('h2', text: 'Cuidar da horta')
  end
end
