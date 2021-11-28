# Procedimento Salvar dados
def salvar_dados
    File.write("save.txt", $itens_estudo.attributes)
    if File.exist?("save.txt")
        puts "Arquivo salvo com sucesso."
        puts "Pressione qualquer tecla para continuar."
        gets
    end
end

# Carregar dados
def carregar_dados
    if File.exist?("save.txt")
        $itens_estudo = File.read("save.txt")
    else
        $itens_estudo = []
    end
end