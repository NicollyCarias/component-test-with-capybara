class GoogleSearchPage 
    include Capybara::DSL

    def open_page?
        find('input[name=q]', visible: true)
        find('input[name=btnK]', visible: true)
    end

    def search(searchText)
        find('input[name=q]').set(searchText)
    end

    def send
        find('input[name=btnK]').click()
    end

    def seeList(searchText)
        find('input[name=q]').set(searchText)
    end

    def firstLink
        find('img[id=rimg_1]').click()
    end

    def receita
        find('input[name=q]', visible: true)
    end

end