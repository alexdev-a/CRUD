class RemoveUniqueIndexFromNomeAndTelefone < ActiveRecord::Migration[8.1]
  def change
    remove_index :pessoas, :nome
    remove_index :pessoas, :telefone
  end
end