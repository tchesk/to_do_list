require 'rails_helper'

feature 'user authenticates before register' do
  scenario 'successfully' do
    visit root_path
    click_on 'Sign up'

    fill_in 'Email', with:'pedro@autoseg.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Repita a senha', with:'123456'
    click_on 'Salvar'

    expect(page).to have_content("Bem-vindo! Você se registrou com êxito.")
    expect(page).to have_link('Sair', href: destroy_user_session_path)
  end
end
