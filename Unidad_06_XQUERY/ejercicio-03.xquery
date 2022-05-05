
for $alumno in doc('ejercicio-planilla-correccion-examen.xml')/correccionExamen/resultadosPorAlumno/alumno
return data($alumno/@nombre)
