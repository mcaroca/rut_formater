# Principal Method

formatRut = (value) ->
  returnedRut = divisionRutDv(value)
  freeRut = returnedRut[0]
  freeDv = returnedRut[1]
  if !(freeRut and freeDv)
    return freeRut or value
  rutFlag = ''
  while freeRut.length > 3
    rutFlag = '.' + freeRut.substr(freeRut.length - 3) + rutFlag
    freeRut = freeRut.substring(0, freeRut.length - 3)
  freeRut + rutFlag + '-' + freeDv

# Division of Rut and DV 
divisionRutDv = (rut) ->
  deletedRut = deleteFormat(rut)
  if deletedRut.length == 0
    return [
      null
      null
    ]
  if deletedRut.length == 1
    return [
      deletedRut
      null
    ]
  freeDv = deletedRut.charAt(deletedRut.length - 1)
  freeRut = deletedRut.substring(0, deletedRut.length - 1)
  [
    freeRut
    freeDv
  ]

# Delete string format
deleteFormat = (value) ->
  value.replace /[\.\-]/g, ''

