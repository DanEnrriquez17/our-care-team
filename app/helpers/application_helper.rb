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
end
