<examen> {
for $alumno in doc('ejercicio-planilla-correccion-examen.xml')/correccionExamen/resultadosPorAlumno/alumno
    let $nombreAlumno := $alumno/@nombre
where starts-with($nombreAlumno, 'Cal')
order by $nombreAlumno descending
return <alumno>{ data($nombreAlumno) }</alumno>
} </examen>