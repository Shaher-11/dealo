module DealsHelper
  #def make_deals(deals)
    #html_values = ''
    #deals.each do |dl|
     # html_values << deals_body(dl)
    #end
    #html_values.html_safe
  #end

  def add_icon(obj, size = '60')
    if obj.groups.first
      if obj.groups.first.icon != ''
        image_tag(obj.groups.first.icon, size: size, alt: "#{obj.name} icon")
      else
        image_tag('https://via.placeholder.com/60', size: size, alt: "#{obj.name} icon")
      end
    else
      image_tag('https://via.placeholder.com/60', size: size, alt: 'Solo Deal icon')
    end
  end

  def deals_body(obj)
    "<a href='/deals/#{obj.id}'>
    <div>
    #{add_deal_icon(obj)}
        <div>
            <p>#{obj.name}</p>
            <p>#{obj.created_at}</p>
        </div>
        <p>Price: $#{obj.amount}</p>
    </div>
    </a>".html_safe
  end

end