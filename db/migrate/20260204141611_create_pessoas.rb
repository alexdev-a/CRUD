class CreatePessoas < ActiveRecord::Migration[8.1]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.string :cpf

      t.timestamps
    end
  end
end
