module ApplicationHelper
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def task_icon(task_type)
    case task_type
    when 'Medical'
      "medical_icon_oyxphu.svg"
    when 'Bills'
      "bills_icon_yil25s.svg"
    when 'Errands'
      "errands_icon_ddwcwr.svg"
    else
      "OTHER_ICON_emnk13.svg"
    end
  end

  def status_display(task)
    if task.status == 'Completed'
      ['Completed', 'status-completed']
    elsif task.due_date < Date.today
      ['Past Due', 'status-past-due']
    elsif task.status == 'Pending'
      ['Pending', 'status-pending']
    else
      [task.status, 'status-default']
    end
  end

  def time_ago_in_words_custom(time)
    time_ago = Time.zone.now - time

    case
    when time_ago <= 1.minute
      "#{time_ago.to_i} seconds ago"
    when time_ago <= 1.hour
      "#{(time_ago/1.minute).to_i} minutes ago"
    when time_ago <= 1.day
      "#{(time_ago/1.hour).to_i} hours ago"
    else
      "#{(time_ago/1.day).to_i} days ago"
    end
  end
end
