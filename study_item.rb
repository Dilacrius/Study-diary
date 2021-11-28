# Classe itens de estudo
require './category.rb'
class StudyItem
    attr_accessor :titulo, :categoria, :status
    def initialize(titulo:, categoria:)
        @titulo = titulo
        @categoria = Category.new(categoria)
        @status = "A fazer"
    end

    def mostrar_itens(index)
        puts "[#{index}]Titulo: #{@titulo} - Categoria: #{@categoria.categoria} - Status: #{@status}"
    end

    def buscar_itens(busca,index)
        if @titulo.include? busca
            mostrar_itens(index)
        end
    end

    def alterar_status()
        @status = "Concluido"
    end
end

