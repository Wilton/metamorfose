export const fillError = (errors, dados) => {
  Object.keys(dados).forEach((key) => {
    if (key in errors) {
      errors[key] = dados[key];
    }
  });
}