module ItemsHelper

  def ajax_flash(div_id)
    response = ""
    flash_div = ""

    flash.each do |name, msg|
      if msg.is_a?(String)
        flash_div = "<div class=\"alert alert-#{name == :notice ? 'success' : 'error'} ajax_flash\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><div id=\"flash_#{name == :notice ? 'notice' : 'error'}\">#{h(msg)}</div></div>"
      end
    end

    response = "$('.ajax_flash').remove();$('#{div_id}').prepend('#{flash_div}');"
    response.html_safe
  end
  
end
