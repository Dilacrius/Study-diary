# Classe itens de estudo
class StudyItem
    attr_accessor :titulo, :categoria
    def initialize(titulo:, categoria: )
        @titulo = titulo
        @categoria = categoria
    end

    def mostrar_itens
        puts "Titulo: " + @titulo + " - Categoria: " + @categoria 
    end
end

# Classe categoria
class Category
    def initialize(categoria:)
        @categoria = categoria
    end    
end
