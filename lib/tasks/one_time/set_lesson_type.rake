namespace :one_time do
  desc "Set Lesson Type for lesson items"

  task set_lesson_type: :environment do
    LessonItem.all.each do |lesson_item|
      lesson_type = LessonType.find_by(name: lesson_item.name, classroom_id: lesson_item.lesson.enrollment.classroom.id)
      lesson_item.update(lesson_type: lesson_type)
    end
  end
end
