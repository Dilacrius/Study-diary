# Classe categoria
class Category
    attr_accessor :categoria
    def initialize(categoria)
        @categoria = categoria
    end

    def self.create(categoria)
        db = SQLite3::Database.open 'banco.db'
        db.execute "INSERT INTO category(categoria) VALUES ('#{categoria}')"
        db.close
    end

    def self.show_all()
        db = SQLite3::Database.open 'banco.db'
        db.results_as_hash = true
        categorias_cadastradas = db.execute "SELECT id, categoria FROM category"
        db.close
        categorias_cadastradas.each{|valor| puts "[#{valor["id"]}] #{valor["categoria"]}"}
    end
end

