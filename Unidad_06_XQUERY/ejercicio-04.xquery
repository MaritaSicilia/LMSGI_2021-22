for $alumno in doc('ejercicio-planilla-correccion-examen.xml')/correccionExamen/resultadosPorAlumno/alumno
return <alumno>{ data($alumno/@nombre) }</alumno>