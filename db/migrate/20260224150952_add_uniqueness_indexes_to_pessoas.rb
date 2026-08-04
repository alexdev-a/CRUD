class AddUniquenessIndexesToPessoas < ActiveRecord::Migration[8.1]
  def change
    add_index :pessoas, :email, unique: true
    # CPF já tem índice, não precisa adicionar
  end
end