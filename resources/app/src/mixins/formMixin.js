import { eventHub } from "../utils/eventHub.js"
import { messages } from "./../utils/messages.js"

const formMixin = {
  created() {
    // this.log('mixin criada')
    if(this.formErrorEvent && this.formErrorEvent != false) {
      eventHub.$on('formError', (event) => {
        this.formError(event)
      })
    }
  },
  
  methods: {
    log(msg) {
      console.log(msg)
    },
    info(msg) {
      this.$emit('notify', {type: 'info', text: msg})
    },
    success(msg) {
      this.$emit('notify', {type: 'success', text: msg})
    },
    error(msg) {
      this.$emit('notify', {type: 'error', text: msg})
    },
    warning(msg) {
      this.$emit('notify', {type: 'warning', text: msg})
    },
    notice(msg) {
      this.$emit('notify', {type: 'warning', text: msg})
    },
    fillError(errors, dados) {
      Object.keys(dados).forEach((key) => {
        if (key in errors) {
          errors[key] = dados[key];
        }
      });
    },
    formError(event) {
      // console.log(event.data)
      // this.$emit('notify', event.data.notify)
      this.notice(messages.EXISTEM_ERROS)
      this.fillError(this.errors, event.data.errors)
    },
    clearForm(form, formErrors) {
      Object.keys(form).forEach((key) => {
        form[key] = '';
        formErrors[key] = []
      });
    }/*,
    toFormData(data = {}, form = null, namespace = '') {
      let files = {};
      let model = {};
      for (let propertyName in data) {
        if (data.hasOwnProperty(propertyName) && data[propertyName] instanceof File) {
          files[propertyName] = data[propertyName]
        } else {
          model[propertyName] = data[propertyName]
        }
      }
  
      model = JSON.parse(JSON.stringify(model))
      let formData = form || new FormData();
  
      for (let propertyName in model) {
        if (!model.hasOwnProperty(propertyName) || !model[propertyName]) continue;
        let formKey = namespace ? `${namespace}[${propertyName}]` : propertyName;
        if (model[propertyName] instanceof Date)
          formData.append(formKey, model[propertyName].toISOString());
        else if (model[propertyName] instanceof File) {
          formData.append(formKey, model[propertyName]);
        }
        else if (model[propertyName] instanceof Array) {
          model[propertyName].forEach((element, index) => {
            const tempFormKey = `${formKey}[${index}]`;
            if (typeof element === 'object') this.toFormData(element, formData, tempFormKey);
            else formData.append(tempFormKey, element.toString());
          });
        }
        else if (typeof model[propertyName] === 'object' && !(model[propertyName] instanceof File))
          this.toFormData(model[propertyName], formData, formKey);
        else {
          formData.append(formKey, model[propertyName].toString());
        }
      }
  
      for (let propertyName in files) {
        if (files.hasOwnProperty(propertyName)) {
          formData.append(propertyName, files[propertyName]);
        }
      }
      return formData;
    }*/
  }
  
}

export default formMixin