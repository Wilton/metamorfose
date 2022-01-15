import Http from './http'

class ProdutoService extends Http {

  model () {
    return 'produto'
  }

  pesquisar (data) {
    return this.post('pesquisar', data)
  }
}

export default ProdutoService