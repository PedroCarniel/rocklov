class EquiposPage
    include Capybara::DSL

    def create(equipo)
        # Checkpoint com timeout explícito
        page.has_css?("#equipoForm")

        upload(equipo[:thumb]) if equipo [:thumb].length > 0

        find("#name").set equipo[:nome]
        selecionar_categoria(equipo[:categoria]) if equipo[:categoria].length > 0
        find("#price").set equipo[:preco]

        click_button "Cadastrar"
    end

    def selecionar_categoria(cat)
        find("#category").find('option', text: cat).select_option
    end

    def upload(file_name)
        thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name

        find("#thumbnail > input[type=file]", visible: false).set thumb
    end
end
