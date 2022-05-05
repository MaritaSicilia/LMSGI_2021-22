<examen> {
for $apartado in doc('ejercicio-planilla-correccion-examen.xml')/correccionExamen/examen/apartado
let $numApartado := $apartado/@numApartado
return <apartadoExamen descripcion="{ $apartado/@descripcion }"> {

        for $alumno in doc('ejercicio-planilla-correccion-examen.xml')/correccionExamen/resultadosPorAlumno/alumno
        let $nombreAlumno := $alumno/@nombre
        return <alumno nombre="{ $nombreAlumno }" 
                valoracion="{$alumno/valoracionApartado[@numApartado = $numApartado]}"></alumno>

        } </apartadoExamen>
} </examen>