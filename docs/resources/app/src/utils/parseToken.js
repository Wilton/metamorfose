export const parseToken = () => {
  if (localStorage.getItem('auth_token')) {
    return JSON.parse(atob(localStorage.getItem('auth_token').split('.')[1]))
  }
  return null
}