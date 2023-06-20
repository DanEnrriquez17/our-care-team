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
end
