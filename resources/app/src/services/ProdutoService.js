import Http from './http'

class ProdutoService extends Http {

  model () {
    return 'produto'
  }


  async alerta () {
    // return fetch('http://ged.local:8085/api/tipo', this.options)
    return this.client.get(`alerta/${this.model()}`)
  }
}

export default ProdutoService