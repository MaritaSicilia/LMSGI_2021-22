<examen> {
for $apartado in doc('ejercicio-planilla-correccion-examen.xml')/correccionExamen/examen/apartado
for $alumno in doc('ejercicio-planilla-correccion-examen.xml')/correccionExamen/resultadosPorAlumno/alumno
let $numApartado := $apartado/@numApartado
let $valoracionApartado := $alumno/valoracionApartado
where $numApartado = $valoracionApartado/@numApartado
return <apartadoExamen descripcion="{ data($apartado/@descripcion) }"
    alumno="{ data($alumno/@nombre) }"
    valoracion="{ data($valoracionApartado[@numApartado = $numApartado]) }"/>
} </examen>
