## CHALLENGE COMPONENT TESTS

## Dependencies

* Ruby 2.5
* Bundler 2.1.4


## WEBDRIVERS

* https://github.com/mozilla/geckodriver/releases
* https://chromedriver.chromium.org/downloads

---

## Installation Instructions

### Install bundler

### Configure gemset


```shell
rvm gemset list
```

If not created, you can do it manually

```shell
rvm gemset use ${folder_name} --create
```

Or if gemset was created but you need to set it, you can do it manually

```shell
rvm gemset use ${folder_name}
```

### Install bundler

To get started, install the bundler in version 2.1.4:

```shell
gem install bundler:2.1.4
```

If you not authenticated on Nexus using bundle, do it:

```shell
bundle config 10.129.178.173 yourVivoUser:password
```

Install dev libs

```shell
bundle config set --local with development 
```

and then

```shell
bundle install --full-index --binstubs 
```



## CAPYBARA

O capybara é um Framework de testes de aceitação para aplicações web escrito na linguagem de programação ruby. Ele pode imitar ações de usuários reais que interagem com aplicativos baseados na web. É uma ótima ferramenta para utilizar em testes, automação, crawlers, robots, entre outras utilidades.

Vantagens do capybara:

- Curva de aprendizado: sua linguagem é simples e intuitiva;
- Comunidade ativa: o que ajuda na busca por materiais na internet;
- Testes de API: gem HTTParty;
- Open source.

### DOCUMENTATION

https://rubydoc.info/github/jnicklas/capybara

### DSL
https://medium.com/testvagrant/web-testing-with-capybara-83b40e351d72


## SITE PRISM

O que é o SitePrism?
O SitePrism é uma DSL (Domain Specific Language) criada para facilitar a criação de page objects para testes automatizados em Ruby, utilizando o Capybara.

O que são page objects?
Page Objects são abstrações da interface do usuário que podem ser usadas nos testes automatizados. A maneira mais comum é modelar cada página como uma classe e usar instância dessa classe em seus testes.


### DOCUMENTATION

https://www.rubydoc.info/gems/site_prism/frames

### Page Object Pattern

https://medium.com/@SphereSoftware/page-object-pattern-in-ruby-with-siteprism-867c7e87939



## CHALLENGES

1) Conforme o criterios de aceita do PO elabore dois teste usando capybara e site prism

    <table>
        <tr><th>CRITERIOS</th></tr>
        <tr>
            <td>
                Dado que acesse o site tudo gostoso<br>
                E realizar a busca por pudim<br>
                E clicar no botão de busca<br>
                Desejo ver a lista de pudins<br>
            </td>
        </tr>
        <tr>
            <td>            
                Dado que acesse o site tudo gostoso<br>
                E realizar a busca por pudim<br>
                E clicar no botão de busca<br>
                E clicar no primeira receita <br>
                Desejo ver a receita<br>
            </td>
        </tr>
    </table>


2) Usando httparty e cucumber faça um cenario para validar a busca por CEP
   Ex: https://viacep.com.br/ws/01001000/json/

```json
{
  "cep": "01001-000",
  "logradouro": "Praça da Sé",
  "complemento": "lado ímpar",
  "bairro": "Sé",
  "localidade": "São Paulo",
  "uf": "SP",
  "ibge": "3550308",
  "gia": "1004",
  "ddd": "11",
  "siafi": "7107"
}
```