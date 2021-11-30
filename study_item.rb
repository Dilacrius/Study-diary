# Classe itens de estudo
class StudyItem
    attr_accessor :titulo, :categoria, :status, :descricao
    def initialize(titulo:, categoria:, status:, descricao:)
        @titulo = titulo
        @categoria = categoria
        @status = status
        @descricao = descricao
    end

    # Criação de itens no banco
    def self.create
        puts "Digite o Título do seu item de estudo: "
        titulo = gets.chomp()
        categoria = ""
        puts "Escolha qual a categoria desejada: "
        Category.show_all()
        categoria = gets.to_i()
        puts "Digite a descrição da tarefa"
        descricao = gets.chomp()
        db = SQLite3::Database.open 'banco.db'
        db.execute "INSERT INTO study_item(titulo, categoria, status, descricao) VALUES ('#{titulo}','#{categoria}', '#{false}', '#{descricao}');"
        db.close
    end

    # Mostrar todos os itens do banco
    def self.show_all()
        puts "Tarefas cadastradas: "
        db = SQLite3::Database.open 'banco.db'
        db.results_as_hash = true
        items_cadastrados = db.execute "SELECT id, titulo, categoria, status, descricao FROM study_item"
        items_cadastrados.each{|valor| 
            StudyItem.show_all_elements(db, valor)
        }
        db.close
    end

    # Alterar Status da tarefa
    def self.change_state()
        puts "Escolha qual tarefa deseja alterar: "
        StudyItem.show_all()
        escolha = gets.to_i
        db = SQLite3::Database.open 'banco.db'
        db.execute "UPDATE study_item SET status = '#{true}' WHERE id = '#{escolha}';"
        db.close
    end

    # Deletar tarefa
    def self.drop()
        puts "Escolha qual tarefa deseja deletar: "
        StudyItem.show_all()
        escolha = gets.to_i
        db = SQLite3::Database.open 'banco.db'
        db.execute "DELETE FROM study_item WHERE id = '#{escolha}';"
        db.close
    end

    # Buscar por titulo
    def self.find_by_title()
        puts "Digite o titulo da tarefa que deseja encontrar: "
        escolha = gets.chomp()
        db = SQLite3::Database.open 'banco.db'
        db.results_as_hash = true
        items_cadastrados = db.execute "SELECT id, titulo, categoria, status, descricao FROM study_item WHERE titulo LIKE '%#{escolha}%'"
        items_cadastrados.each{|valor| 
            StudyItem.show_all_elements(db, valor)
        }
        db.close
    end
    
    # Buscar por descricao
    def self.find_by_description()
        puts "Digite a descrição da tarefa que deseja encontrar: "
        escolha = gets.chomp()
        db = SQLite3::Database.open 'banco.db'
        db.results_as_hash = true
        items_cadastrados = db.execute "SELECT id, titulo, categoria, status, descricao FROM study_item WHERE descricao LIKE '%#{escolha}%'"
        items_cadastrados.each{|valor| 
            StudyItem.show_all_elements(db, valor)
        }
        db.close
    end

    # Buscar por status
    def self.find_by_status()
        puts "Escolha uma opção abaixo: \n[1]Ver itens a fazer \n[2]Ver itens concluidos"
        escolha = gets.to_i
        status = false
        if escolha == 1
            status = false
        else
            status = true
        end
        db = SQLite3::Database.open 'banco.db'
        db.results_as_hash = true
        items_cadastrados = db.execute "SELECT id, titulo, categoria, status, descricao FROM study_item WHERE status = '#{status}'"
        items_cadastrados.each{|valor| 
            StudyItem.show_all_elements(db, valor)
        }
        db.close
    end

    # Buscar por categoria
    def self.find_by_category()
        puts "Escolha uma opção abaixo: "
        Category.show_all
        escolha = gets.to_i
        db = SQLite3::Database.open 'banco.db'
        db.results_as_hash = true
        items_cadastrados = db.execute "SELECT id, titulo, categoria, status, descricao FROM study_item WHERE categoria = '#{escolha}'"
        items_cadastrados.each{|valor| 
            StudyItem.show_all_elements(db, valor)
        }
        db.close
    end

    # Mostrar todos os elementos
    def self.show_all_elements(db, valor)
        categoria = db.execute "SELECT categoria FROM category where id = '#{valor["categoria"]}';"
        print "[#{valor["id"]}] Titulo: #{valor["titulo"]} - Categoria: "
        categoria.each{|c|print c["categoria"]} 
        print " - Status: " 
         if valor["status"] == "false"
            print "A fazer - "
         else
            print "Concluido - "
         end
        puts "Descricao: #{valor["descricao"]}"
    end
end

