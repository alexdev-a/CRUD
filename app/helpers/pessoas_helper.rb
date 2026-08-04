module PessoasHelper
  def formatar_cpf(cpf)
    return '' if cpf.blank?
    cpf = cpf.gsub(/[^\d]/, '') # Remove formatação se já tiver
    cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4')
  end
end