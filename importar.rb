require 'json'

arquivo = File.read('pessoas.json')
dados = JSON.parse(arquivo)

dados.each do |pessoa|
  Pessoa.create!(
    nome: pessoa["nome"],
    telefone: pessoa["telefone"],
    email: pessoa["email"],
    cpf: pessoa["cpf"],
    created_at: pessoa["created_at"],
    updated_at: pessoa["updated_at"]
  )
end

puts "Dados importados com sucesso!"