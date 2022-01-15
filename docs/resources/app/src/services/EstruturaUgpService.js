import Http from './http'

class EstruturaUgpService extends Http {

  model () {
    return 'estrutura'
  }

  async vinculadas(uor) {
    return await this.client.get(`${this.model()}/${uor}/vinculadas`);
  }

  async vinculadasComFuncionarios(uor) {
    return await this.client.get(`${this.model()}/${uor}`);
  }

  async funcionariosVinculados(uor) {
    return await this.client.get(`${this.model()}/${uor}/funcionarios`)
  }
}

export default EstruturaUgpService