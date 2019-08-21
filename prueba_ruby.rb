def read_alum(file_name)
  file=File.open(file_name, 'r')
  alum=file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
end
#1)promedio de notas de cada alumno
def avarage(student_avarage)
  student_avarage.each do |student|
    suma =0
    avarage=0
      student.each_with_index do |grades , index|
        if index!=0
          suma +=grades.to_i
          avarage=suma.to_f/index
        end
      end
      puts "  #{student[0]} tiene como pormedio de notas un : #{avarage} "
  end
end





student=read_alum("alumnos.csv")
option = 0
while option!=4
   puts "ingrese una opcion : "
   puts "opcion 1 : mostrar promedio de notas de cada alumno"
   puts "opcion 2 : mostrar inasistencias de cada alumno "
   puts "opcion 3 : mostrar alumnos aprobados "
   puts "opcion 4 salir "
   puts "---------------------------------------------------------------"
   option=gets.chomp.to_i
   case option
     when 1
      avarage(student)
     when 2
      student_ubsent(student)
     when 3
      student_no_fail(student)
    when 4
      puts "exit"
     else
      puts "opcion no valida"
   end
end
