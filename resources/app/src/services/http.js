import axios from 'axios';
import { eventHub } from '../utils/eventHub'

class Http {

  constructor () {
    this.client = this.createHttpClient()
    // this.headers = {
    //     'Access-Control-Allow-Origin': '*',
    //     'Accept': 'application/json',
    //     'content-type': 'multipart/form-data',
    //     'X-Requested-With': 'XMLHttpRequest',
    //     common: {
    //
    //     }
    // }

    // this.headers = new Headers()
    // // this.headers.append("Content-Type", "application/x-form-urlencoded")
    // // this.headers.append('Access-Control-Allow-Origin', '*')
    // this.headers.append('Origin', 'http://localhost:8080')

    // // this.headers.append("Accept", "application/json")
    // this.options = {
    //   method: 'GET',
    //   // mode: 'no-cors',
    //   headers: this.headers
    // }
  }

  parseToken() {
    return JSON.parse(atob(localStorage.getItem('auth_token').split('.')[1]));
  }

  verifyTokenExpiration()
  {}

  parseFormErros(error) {
    // let eventData = {
    //   model: {},
    //   message: {}
    // }
    console.log('request errror inicio')
    console.log(error)
    console.log('request errror fim')

    // for (const key in error.data.errors) {
    //   let value = error.data.errors[key];
    //   if (error.data.errors.hasOwnProperty(key)) {
    //     eventData.model[key] = true
    //     eventData.message[key] = value
    //   }
    // }
  }

  model () {
  // Simulates an interface
    throw new Error('Not implemented yet')
  }

  createHttpClient() {
    let auth_token = localStorage.getItem('auth_token') || ''
    // let id_token = localStorage.getItem('id_token') || ''

    let config = {
      baseURL: 'http://localhost/api/',
      // timeout: 1000,
      crossdomain: true,
      // headers: this.headers
      // mode: 'no-cors',

      headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        // 'content-type': 'multipart/form-data',
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        common: {
      //     'Accept': 'application/json',
      //     // 'Access-Control-Allow-Headers' : '*',
      //     // 'Access-Control-Allow-Headers' : 'Content-Type, X-Auth-Token, Origin, Authorization, Access-Control-Allow-Credentials',
      //     // 'Access-Control-Allow-Credentials': true,

      //     // 'Content-Type': 'application/json',
      //     // 'Origin': '*',
      //     // 'Access-Control-Allow-Origin': '*',
      //     // 'Access-Control-Allow-Headers': 'Set-Cookie',

      //     // 'Access-Control-Request-Method': '*',
      //     // 'Access-Token': auth_token,
          'Authorization': `Bearer ${auth_token}`
        },
        // 'X-Requested-With': 'XMLHttpRequest'
      }
    }

    let client = axios.create(config);
    client.interceptors.request.use(
      conf => {
        eventHub.$emit('before-request');
        return conf;
      },
      error => {
        eventHub.$emit('request-error');
        return Promise.reject(error);
      }
    )

    client.interceptors.response.use((response) => {
        return response;
      },
      err => {
        let error = err.response
        // console.log(err)

        if(error.data.token_error) {
          eventHub.$emit('token_error', error.data.message)
        } else if(error.data !== undefined) {
          // tratando as mensagens de erro oriundas de formulario
          eventHub.$emit('response-error')
          // let eventData = this.parseFormErros(error)
          // error.data.notify = {type: 'error', text: error.data.message}
          eventHub.$emit('formError', error)
        }

        return Promise.reject(err.response)
      }
    )

    return client
  }

  async create (data) {
    // console.log('http create')
    // console.log(data)
    // console.log('fim http create')
    return await this.client.post(this.model(), data)
  }

  async list () {
    // return fetch('http://ged.local:8085/api/tipo', this.options)
    return this.client.get(`${this.model()}`)
  }

  async paginate (params) {
    return this.client.get(`${this.model()}?${params}`)
  }

  async pesquisar (params, data) {
    let p = {
      'page': 1,
      'sortBy': 'id',
      'sortType': 'asc',
      'per_page': 15 
    }

    const { sortBy, sortDesc, page, itemsPerPage } = params

    p.page = page ? page : 1
    p.per_page = itemsPerPage ? itemsPerPage : 15

    if (sortBy && sortBy.length === 1 && sortDesc.length === 1) {
      p.sortBy = sortBy[0]
      p.sortType =  (sortDesc[0]) ? 'asc' : 'desc'
    }

    let u = new URLSearchParams(p).toString();
    return this.client.post(`${this.model()}/pesquisar?${u}`, data)
  }

  async read (id) {
    return this.client.get(`${this.model()}/${id}`)
  }

  async update (id, data) {
    // let data_json = JSON.parse(data)
    // data_json['_method'] = 'PUT'
    // data = JSON.stringify(data_json)
    return await this.client.put(`${this.model()}/${id}`, data)
  }

  async delete (id) {
    return this.client.delete(`${this.model()}/${id}`)
  }

  async get(resource) {
    return this.client.get(`${this.model()}/${resource}`)
  }

  async post(resource, data) {
    return this.client.post(`${this.model()}/${resource}`, data)
  }
}


// let auth_token = localStorage.getItem('auth_token') || ''
// let id_token = localStorage.getItem('id_token') || ''

// let config = {
//     baseURL: 'http://ged.local:8085/api/',
//     timeout: 1000,
//     crossdomain: true,
//     headers: {
//         common: {
//           'Accept': 'application/json',
//           'Access-Control-Allow-Headers' : '*',
//           // 'Access-Control-Allow-Headers' : 'Content-Type, X-Auth-Token, Origin, Authorization, Access-Control-Allow-Credentials',
//           'Access-Control-Allow-Credentials': 'true',
//           'Content-Type': 'application/json',
//           'Origin': 'http://icfo.local',
//           'Access-Control-Allow-Origin': '*',
//           'Access-Control-Request-Method': '*',
//           'Access-Token': auth_token,
//           'Authorization': `Bearer ${id_token}`
//         },
//         'X-Requested-With': 'XMLHttpRequest'
//     }  
// }

// const http = axios.create(config);

export default Http; 