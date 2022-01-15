import Http from './http'

class ArhService extends Http {

  model () {
    return 'arh'
  }

  listarFuncionariosPorUor(id) {
    return this.client.get(`${this.model()}/${id}/funcionarios`)
  }
}

export default ArhService