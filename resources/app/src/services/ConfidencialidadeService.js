import Http from './http'

class ConfidencialidadeService extends Http {

    model () {
        return 'confidencialidade'
    }

  async pesquisar(data) {
    return await this.client.post(`${this.model()}/pesquisar`, data)
  }
}

export default ConfidencialidadeService