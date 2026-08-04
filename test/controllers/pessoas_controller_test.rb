require "test_helper"

class PessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa = Pessoa.create!(
      nome: "Teste",
      telefone: "11999999999",
      email: "teste#{SecureRandom.hex(4)}@teste.com",
      cpf: rand(10**11).to_s.rjust(11, '0')
    )
  end

  test "should get index" do
    get pessoas_url
    assert_response :success
  end

  test "should get new" do
    get new_pessoa_url
    assert_response :success
  end

  test "should create pessoa" do
    assert_difference("Pessoa.count") do
      post pessoas_url, params: {
        pessoa: {
          nome: "Novo Nome",
          telefone: "11988887777",
          email: "novo#{SecureRandom.hex(4)}@teste.com",
          cpf: rand(10**11).to_s.rjust(11, '0')
        }
      }
    end

    assert_redirected_to pessoas_url
  end

  test "should show pessoa" do
    get pessoa_url(@pessoa)
    assert_response :success
  end

  test "should get edit" do
    get edit_pessoa_url(@pessoa)
    assert_response :success
  end

  test "should update pessoa" do
    patch pessoa_url(@pessoa), params: {
      pessoa: {
        cpf: @pessoa.cpf,
        email: @pessoa.email,
        nome: @pessoa.nome,
        telefone: @pessoa.telefone
      }
    }

    # ALTERADO AQUI 👇
    assert_redirected_to pessoas_url
  end

  test "should destroy pessoa" do
    assert_difference("Pessoa.count", -1) do
      delete pessoa_url(@pessoa)
    end

    assert_redirected_to pessoas_url
  end
end