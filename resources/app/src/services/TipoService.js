import Http from './http'

class TipoService extends Http {

  model () {
    return 'tipo'
  }

  async pesquisar(data) {
    return await this.client.post(`${this.model()}/pesquisar`, data)
  }
}

export default TipoService