export const toFloat = (num) => {
    let numberParts = num.split(',')
    // console.log(numberParts)
    // console.log(Number(numberParts[0].replace(/\D/g, '')))
    let val = parseFloat(numberParts[0].replace(/\D/g, '') + '.' + numberParts[1])
    // console.log(val)
    return val


}