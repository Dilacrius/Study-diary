# Classe itens de estudo
require './category.rb'
class StudyItem
    attr_accessor :titulo, :categoria
    def initialize(titulo:, categoria: )
        @titulo = titulo
        @categoria = Category.new(categoria)
    end

    def mostrar_itens
        puts "Titulo: " + @titulo + " - Categoria: " + @categoria.categoria
    end

    def buscar_itens(busca)
        if @titulo.include? busca
            mostrar_itens
        end
    end
end

