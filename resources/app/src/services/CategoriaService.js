import Http from './http'

class CategoriaService extends Http {

  model () {
    return 'categoria'
  }

  async read(id) {
    return this.client.get(`${this.model()}/${id}`)
  }

  async update(id, data) {
    // data['_method'] = 'PUT'
    return this.client.put(`${this.model()}/${id}`, data)
  }

  // async delete(id, data) {
  //   // data['_method'] = 'PUT'
  //   return this.client.delete(`${this.model()}/${id}`)
  // }

}

export default CategoriaService