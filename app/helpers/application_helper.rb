module ApplicationHelper
  include Pagy::Frontend

  def bootstrap_class_for(flash_type)
    case flash_type
    when "notice"
      "success"
    when "alert"
      "danger"
    else
      flash_type.to_s
    end
  end
end
