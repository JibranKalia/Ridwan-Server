class FakeData
  def initialize(user, params = {})
    @user = user
    @params = params
  end

  def generate
    create_teacher
    create_classroom
    create_students
  end

  def create_teacher
    @teacher = @user.teacher
    if @teacher.nil? 
      @teacher = Teacher.create!(user: @user)
    end
  end

  def create_classroom
    @classroom = Classroom.create!(teacher: @teacher, name: Faker::Educator.course_name)
  end

  def create_students
    student_count = @params[:student_count] || 10
    student_count.times do 
      student = Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
      Enrollment.create!(classroom: @classroom, student: student)
    end
  end
end