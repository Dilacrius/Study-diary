# Classe categoria
class Category
    attr_accessor :categoria
    def initialize(categoria)
        @categoria = categoria
    end    

    def mostrar_categoria(index)
        puts "[#{index}] #{@categoria}"
    end
end

