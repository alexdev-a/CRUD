class Pessoa < ApplicationRecord
  validates :nome, presence: true
  validates :telefone, presence: true, uniqueness: true, length: { is: 11 }

  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :cpf, presence: true,
                  uniqueness: true,
                  length: { is: 11 }

  before_validation :limpar_cpf
  
  private
  
  def limpar_cpf
    self.cpf = cpf.gsub(/[^\d]/, '') if cpf.present?
  end
end

