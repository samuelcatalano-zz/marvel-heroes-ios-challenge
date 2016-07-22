# Heroes


Telas
- Listagem das revistas
- Detalhes de uma revista - Tela sobre você
Chamadas para obter as revistas:
http://gateway.marvel.com:80/v1/public/characters/1009351/comics?ts=1&apikey=bb4470a46d0659a43c566ac6056ed48d&hash=479474cf0a28eac9998 960da4d96f06b
Regras gerais:
- Suportar iOS 8
- Autolayout
- Não bloquear a main thread
Diferenciais:
- Múltiplas orientações - Customização visual - Animações
- Código reutilizável
Critérios de avaliação:
- Capacidade técnica
- Código legível
- Conhecimento da plataforma e das ferramentas
       
Regras da tela de revistas:
- Exibir as revistas do herói escolhido
- Não é necessário paginar mais resultados, exibir somente a quantidade de retorno padrão
- Deve conter:
- Miniatura da capa da revista (thumbnail)
- Número da revista (issueNumber)
- Copyright ao final da listagem (“Data provided by Marvel. © 2014 Marvel”)
Regras da tela de detalhes da revista:
- Utilizar os assets propostos de acordo com o herói escolhido - Exibir as informações completas da revista selecionada
- Deve conter:
- Título (title)
- Descrição (description)
- Data de publicação (dates -> onsaleDate) - Preço (prices -> printPrice)
- Quantidade de páginas (pageCount)
Regras da tela de sobre você:
- Usar o fundo proposto
- Use a sua criatividade para se descrever :-)
Dica para trabalhar com as imagens da API:
"thumbnail": {
"path": "http://i.annihil.us/u/prod/marvel/i/mg/6/10/4da714e7520b6", "extension": "jpg"
}
portrait_small portrait_medium portrait_xlarge portrait_fantastic portrait_uncanny portrait_incredible
50x75px 100x150px 150x225px 168x252px 300x450px 216x324px
EXEMPLO: http://i.annihil.us/u/prod/marvel/i/mg/6/10/4da714e7520b6/ portrait_medium.jpg
