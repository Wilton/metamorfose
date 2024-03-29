export const fileSizeInBytes = (value) => {
  var i = -1;
  var byteUnits = [' kB', ' MB', ' GB', ' TB', 'PB', 'EB', 'ZB', 'YB'];
  do {
    value = value / 1024;
    i++;
  } while (value > 1024);

  return Math.max(value, 0.1).toFixed(1) + byteUnits[i];
}