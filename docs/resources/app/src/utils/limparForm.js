export const limparForm = (form) => {
  Object.keys(form).forEach((key) => {
    form[key] = '';
  });
}