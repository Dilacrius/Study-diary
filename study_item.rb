# Classe itens de estudo
class StudyItem
    attr_accessor :titulo, :categoria, :status, :descricao
    def initialize(titulo:, categoria:, descricao:)
        @titulo = titulo
        @categoria = categoria
        @status = "A fazer"
        @descricao = descricao
    end

    def mostrar_itens(index)
        puts "[#{index}]Titulo: #{@titulo} - Categoria: #{@categoria.categoria} - Status: #{@status} - Descricao: #{@descricao}" 
    end

    def buscar_itens_titulo(busca,index)
        if @titulo.include? busca
            mostrar_itens(index)
        end
    end

    def buscar_itens_descricao(busca,index)
        if @descricao.include? busca
            mostrar_itens(index)
        end
    end

    def buscar_itens_categoria(busca,index)
        if @categoria.categoria == busca
            mostrar_itens(index)
        end
    end

    def alterar_status()
        @status = "Concluido"
    end
end

