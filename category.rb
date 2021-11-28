# Classe categoria
class Category
    attr_accessor :categoria
    def initialize(categoria)
        @categoria = categoria
    end    

    def iniciar_categorias
        $categories << [Rails, Ruby, HTML]
    end
end

