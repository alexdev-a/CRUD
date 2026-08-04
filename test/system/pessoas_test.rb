require "application_system_test_case"
require "securerandom"

class PessoasTest < ApplicationSystemTestCase
   self.use_transactional_tests = true

  self.fixture_paths = []

  test "criar nova pessoa com sucesso" do
    visit pessoas_path
    
    click_on "Nova Pessoa"
    
     email = "joao#{SecureRandom.hex(4)}@teste.com"

    fill_in "Nome", with: "João Silva"
    fill_in "Telefone", with: "11999887766"
    fill_in "Email", with: email
    fill_in "CPF", with: rand(10**11).to_s.rjust(11, '0')
    
    click_on "Criar Pessoa"
    
    assert_text "Cadastro criado com sucesso"
    assert_text "João Silva"
    assert_text email
  end

  test "não criar pessoa com dados inválidos" do
    visit new_pessoa_path
    
    click_on "Criar Pessoa"
    
    assert_text "não pode ficar em branco"
  end

  test "editar pessoa existente" do
    pessoa = Pessoa.create!(
     nome: "Maria Santos",
     telefone: "11988776655",
     email: "maria#{SecureRandom.hex(4)}@teste.com",
      cpf: rand(10**11).to_s.rjust(11, '0')
)
    
    visit pessoas_path
    
    within("#pessoa_#{pessoa.id}") do
      click_on "Editar"
    end
    
    fill_in "Nome", with: "Maria Silva Santos"
    click_on "Atualizar Pessoa"
    
    assert_text "Cadastro editado com sucesso"
    assert_text "Maria Silva Santos"
  end

  test "excluir pessoa com confirmação" do
    pessoa = Pessoa.create!(
      nome: "Pedro Oliveira",
      telefone: "11977665544",
      email: "pedro@teste.com",
      cpf: "11122233344"
    )
    
    visit pessoas_path
    
    accept_confirm do
      within("#pessoa_#{pessoa.id}") do
        click_on "Excluir"
      end
    end
    
    assert_text "Cadastro deletado com sucesso"
    assert_no_text "Pedro Oliveira"
  end

  test "validar unicidade de CPF" do
    Pessoa.create!(
      nome: "Ana Costa",
      telefone: "11966554433",
      email: "ana@teste.com",
      cpf: "55566677788"
    )
    
    visit new_pessoa_path
    
    fill_in "Nome", with: "Carlos Costa"
    fill_in "Telefone", with: "11955443322"
    fill_in "Email", with: "carlos@teste.com"
    fill_in "CPF", with: "55566677788"
    
    click_on "Criar Pessoa"
    
    assert_text "CPF já está em uso"
  end

  test "validar unicidade de Email" do
    Pessoa.create!(
      nome: "Lucas Ferreira",
      telefone: "11944332211",
      email: "lucas@teste.com",
      cpf: "99988877766"
    )
    
    visit new_pessoa_path
    
    fill_in "Nome", with: "Paula Ferreira"
    fill_in "Telefone", with: "11933221100"
    fill_in "Email", with: "lucas@teste.com"
    fill_in "CPF", with: "88877766655"
    
    click_on "Criar Pessoa"
    
    assert_text "Email já está em uso"
  end

  test "validar formato de email" do
    visit new_pessoa_path
    
    fill_in "Nome", with: "Roberto Lima"
    fill_in "Telefone", with: "11922110099"
    fill_in "Email", with: "email_invalido"
    fill_in "CPF", with: "77766655544"
    
    click_on "Criar Pessoa"
    
    assert_text "Email não é válido"
  end

  test "validar tamanho do CPF" do
    visit new_pessoa_path
    
    fill_in "Nome", with: "Fernanda Souza"
    fill_in "Telefone", with: "11911009988"
    fill_in "Email", with: "fernanda@teste.com"
    fill_in "CPF", with: "123" # CPF com menos de 11 dígitos
    
    click_on "Criar Pessoa"
    
    assert_text "CPF não possui o tamanho esperado"
  end
end