class Todo < ActiveRecord::Base

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    " #{is_completed}. #{id}. #{due_date.to_s(:long)} #{todo_text}."
  end

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Later\n"
    puts due_later.map { |todo| todo.to_displayable_string }
    puts "\n\n"
  end

  def self.completed
    all.where(completed: true)
  end

end
