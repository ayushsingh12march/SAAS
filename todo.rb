require "active_record"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def self.add_task(new_todo)
    create!(todo_text: new_todo[:todo_text], due_date: Date.today + new_todo[:due_in_days], completed: false)
  end

  def self.overdue_list
    where("due_date < :dateToday ", dateToday: Date.today).map { |todo| puts todo.to_displayable_string }
  end

  def self.due_today
    where("due_date = :dateToday ", dateToday: Date.today).map { |todo| puts todo.to_displayable_string }
  end

  def self.due_later
    where("due_date > :dateToday ", dateToday: Date.today).map { |todo| puts todo.to_displayable_string }
  end

  def self.mark_as_complete!(todo_id)
    todo = find(todo_id)
    todo.update(completed: true)
    return todo
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}.  #{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "My Todo-list"
    puts "\nOverdue"
    overdue_list
    puts "\n\nDue Today"
    due_today
    puts "\n\nDue Later"
    due_later
  end
end
