Dado('que esteja na tela de busca') do
    visit('/')
    @google_search_page = GoogleSearchPage.new
    @google_search_page.open_page?
end

Quando('fazer busca por {string}')  do |searchText|
    @google_search_page.search(searchText)
end

E('clicar no botão pesquisa Google') do
    @google_search_page.send
end

E('deve visualizar links de receita de {string}') do |searchText|
    @google_search_page.seeList(searchText)
end

E('clicar no primeira receita') do
    @google_search_page.firstLink
end

Então('desejo ver a receita') do
    @google_search_page.receita
end