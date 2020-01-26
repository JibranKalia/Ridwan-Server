namespace :one_time do
  desc "Create Lesson Types for all Classrooms"
  task create_lesson_types: :environment do
    Classroom.all.each do |classroom|
      classroom.create_default_lesson_types
    end
  end
end
