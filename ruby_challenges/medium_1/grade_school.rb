class School
  def initialize
    @students = {}
  end

  def add(name, grade)
    @students.has_key?(grade) ? nil : @students[grade] = []
    @students[grade] << name
    sort_grades_and_students!(grade)
  end

  def to_h
    @students
  end

  def grade(n)
    return [] unless @students.has_key?(n)
    @students[n]
  end

  private

  def sort_grades_and_students!(grade)
    sort_students_in!(grade)
    sort_grades_in_hash!
  end

  def sort_grades_in_hash!
    @students = @students.sort.to_h
  end

  def sort_students_in!(grade)
    @students[grade].sort!    
  end
  
end