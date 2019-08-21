def read_alum(file_name)
  file=File.open(file_name, 'r')
  alum=file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
end


#1)promedio de notas de cada alumno
def avarage_student(student_avarage)
  student_avarage.each do |student|
    sum=0
    avarage=0
      student.each_with_index do |grades , index|
        if index!=0
          suma +=grades.to_i
          avarage=sum.to_f/index
        end
      end
      puts "  #{student[0]} tiene como pormedio de notas un : #{avarage} "
  end
end
#2)inasistencias
def student_ubsent (absent_student)
  absent_student.each do |absent|
    caunt=0
    absent.each_with_index do |element , index|
      caunt +=1 if index !=0 && element =="A"
    end
    puts "el alumno/a #{absent[0]} tiene #{caunt} inasistencias"
  end
end
#3)estudiantes aprobados pruebalo
def student_no_fail(student_avarage , approved)
  student_avarage.each do |student|
    suma =0
    avarage=0
    aux=5
    student.each_with_index do |grades , index|
      if index!=0
        suma +=grades.to_i
        avarage=suma.to_f/index
      end
    end
    approved = aux if approved == 0
    puts "  aprobo #{student[0]} con un  #{avarage} "  if avarage >= approved
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
      avarage_student(student)
    when 2
      student_ubsent(student)
    when 3
      puts "ingrese una nota"
      approved=gets.chomp.to_f
      student_no_fail(student ,approved)
    when 4
      puts "Adios"
    else
      puts "opcion no valida"
    end
end
