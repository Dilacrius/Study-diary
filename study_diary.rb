# Diario de Estudo em Ruby
# study_diary.rb

 $itens_estudo = ""

# Classe itens de estudo
class StudyItem
    def initialize(titulo:, categoria: )
        @titulo = titulo
        @categoria = categoria
    end

    def mostrar_itens
        puts "Titulo: " + @titulo + " - Categoria: " + @categoria 
    end
end

# Procedimento Menu
def menu_inicial
    escolha = 0
    while escolha != 4 do
        clear_screen
        puts "[1] Cadastrar um item para estudar \n[2] Ver todos os itens cadastrados \n[3] Buscar um item de estudo \n[4] Sair \nEscolha uma opção:"
        escolha = gets.to_i 

        case escolha
        when 1
            cadastrar_item
        when 2
            ver_itens
        when 3
            buscar_itens
        when 4
            puts "Saindo do programa ..."
        else
            puts "Desculpe, não entendi sua requisição."
        end
    end
end

# Procedimento Cadastrar item para estudar
def cadastrar_item
    puts "Digite o Título do seu item de estudo: "
    titulo = gets.chomp()
    categoria = ""
    while categoria == "" do
        puts "Escolha qual a categoria desejada: \n[1]Ruby \n[2]Rails \n[3]HTML"
        categoria_escolha = gets.to_i
        case categoria_escolha
        when 1
            categoria = "Ruby"
        when 2 
            categoria = "Rails"
        when 3
            categoria = "HTML"
        else
            puts "Erro! Favor digite uma categoria valida." 
        end
    $itens_estudo = StudyItem.new(titulo: titulo, categoria: categoria)
    puts "Estudo cadastrado com sucesso. Pressione qualquer tecla para continuar"
    gets
    end
end

# Procedimento Ver todos os itens
def ver_itens
    if $itens_estudo == ""
        puts "Desculpe, não encontramos itens cadastrados."
        puts "Pressione qualquer tecla para continuar"
        gets
    else
        puts $itens_estudo.mostrar_itens
        puts "Pressione qualquer tecla para continuar"
        gets
    end
end

# Procedimento Buscar item de estudo
def buscar_itens
    
end

# Procedimento Limpar a tela
def clear_screen
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
       system('cls')
     else
       system('clear')
    end
end

# Executa o procedimento menu inicial
menu_inicial