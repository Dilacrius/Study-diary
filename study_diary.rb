# Diario de Estudo em Ruby
require 'sqlite3' 
require './study_item.rb'
require './category.rb'

# Carregar dados
def carregar_dados()
    if File.exist?("banco.db")
        menu_inicial()
    else
        db = SQLite3::Database.open 'banco.db'
        db.execute "CREATE TABLE IF NOT EXISTS category(id integer primary key autoincrement, categoria varchar(255))"
        db.execute "CREATE TABLE IF NOT EXISTS study_item(id integer primary key autoincrement, titulo varchar(255), categoria integer, status varchar(255), descricao varchar(255), FOREIGN KEY (categoria) REFERENCES category(id))"
        Category.create("Ruby")
        Category.create("Rails")
        Category.create("HTML")
        menu_inicial()
    end
end

# Procedimento Menu
def menu_inicial()
    escolha = ""
    while escolha != 0 do
        clear_screen
        puts "Diario de estudos"
        puts "[1] Cadastrar uma tarefa para estudar \n[2] Alterar status da tarefa \n[3] Ver tarefas cadastradas \n[4] Deletar tarefas \n[0] Sair \nEscolha uma opção:"
        escolha = gets.to_i 
        case escolha
        when 1
            StudyItem.create()
            finalizado_tarefa()
        when 2
            StudyItem.change_state()
            finalizado_tarefa() 
        when 3
            ver_tarefas()
        when 4
            StudyItem.drop()
            finalizado_tarefa()
        when 0
            puts "Obrigado por usar Diario de estudos."
            puts "Saindo do programa ..."
        else
            puts "Desculpe, não entendi sua requisição."
        end
    end
end

# Procedimento Ver tarefas
def ver_tarefas()
    puts "Escolha a opção desejada: \n[1]Ver todas as tarefas \n[2]Busca por categoria \n[3]Busca por status da tarefa \n[4]Buscar por titulo \n[5]Buscar por descrição \n[0]Voltar"
    escolha = gets.to_i
    case escolha
    when 1
        StudyItem.show_all()
    when 2
        StudyItem.find_by_category()
    when 3
        StudyItem.find_by_status()
    when 4
        StudyItem.find_by_title()
    when 5
        StudyItem.find_by_description()
    when 0
        puts "Voltando a tela inicial."
    else
        puts "Erro! Escolha não encontrada."
    end
    finalizado_tarefa()
end

# Procedimento Limpar a tela
def clear_screen()
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
       system('cls')
     else
       system('clear')
    end
end

def finalizado_tarefa()
    puts "Pressione qualquer tecla para continuar."
    gets
end

# Executa o procedimento menu inicial
carregar_dados()