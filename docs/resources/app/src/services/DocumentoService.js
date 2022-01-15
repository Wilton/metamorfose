import Http from './http'

class DocumentoService extends Http {

  model () {
    return 'documento'
  }

  async download(id) {
    return await this.client.get(`${this.model()}/${id}/download`)
  }

  async pesquisar(data) {
    //
    // baseURL: 'http://ged.local:8085/api/',
    //   timeout: 10000,
    //   crossdomain: true,
    //   headers: {
    //   'Access-Control-Allow-Origin': '*',
    //     'Accept': 'application/json',
    //     'content-type': 'multipart/form-data'
    // }

    // return await fetch("http://ged.local:8085/api/documento/pesquisar", {
    //   method: "POST",
    //   body: JSON.stringify(data),
    //   headers: new Headers({
    //     'Content-type': 'multipart/form-data',
    //     'Accept': 'application/json',
    //   })
    // });
    // let dados = Object.keys(data).map(function(key) {
    //   return encodeURIComponent(key) + '=' + encodeURIComponent(data[key])
    // }).join('&')

    return await this.client.post(`${this.model()}/pesquisar`, data)
  }
}

export default DocumentoService