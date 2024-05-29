require 'rails_helper'

describe 'Inn owner manage promotions' do
  it 'successfully' do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', active: true, registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    room1 = inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)
    room2 = inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)
    
    login_as inn_owner, scope: :inn_owner

    visit inn_management_path
    click_on 'Nova Promoção'
    fill_in 'Nome', with: 'Black Friday'
    fill_in 'Data de Início', with: '15/11/2024'
    fill_in 'Data de Fim', with: '25/12/2024'
    click_on 'Criar Promoção'

    expect(page).to have_css 'div.alert', text: 'Promoção criada com sucesso!'
    expect(page).to have_content 'Black Friday'
    expect(page).to have_content '15/11/2024 - 25/12/2024'

    click_on 'Adicionar Quartos à Promoção'
    check 'Quarto com Varanda'
    fill_in 'Desconto (%)', with: '10', match: :first
    check 'Quarto Térreo'
    fill_in 'Desconto (%)', with, '20', match: :prefer_exact
    click_on 'Salvar Descontos'

    expect(page).to have_content 'Quarto com Varanda: 10% de desconto'
    expect(page).to have_content 'Quarto Térreo: 20% de desconto'
  end
end