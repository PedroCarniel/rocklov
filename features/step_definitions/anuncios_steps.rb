Dado('que estou logado como {string} e {string}') do |email, password|
    @email = email

    @login_page.open
    @login_page.with(email, password)
  end

  Dado('que acesso o formulário de cadastro de anúncios') do
    #Step de pré-condição
    click_button "Criar anúncio"
    expect(page).to have_css "#equipoForm" # Checkpoint pra garantir que está na pagina certa
  end

Dado('que eu tenho o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash
    log @anuncio

    MongoDB.new.remover_equipamento(@anuncio[:nome], @email)
end

Quando('submeto o cadastro desse item') do
    # Localiza a imagem e concantena com a massa de teste
    thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

    # Pega o elemento oculto da página
    find("#thumbnail > input[type=file]", visible: false).set thumb

    # Busca os elementos pela categoria
    find("#name").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("#price").set @anuncio[:preco]

    click_button "Cadastrar"
end

Então('devo ver esse item no meu Dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end
