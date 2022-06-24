#language: pt

@search-google
@desktop
Funcionalidade: Mecanismo de busca

  Cenário: Deve buscar por receita de pudim
    Dado que esteja na tela de busca
    Quando fazer busca por "pudim"
    E clicar no botão pesquisa Google
    Então deve visualizar links de receita de "pudim"

  Cenário: Deve buscar por receita de pudim
    Dado que esteja na tela de busca
    Quando fazer busca por "pudim"
    E clicar no botão pesquisa Google
    E clicar no primeira receita
    Então desejo ver a receita



