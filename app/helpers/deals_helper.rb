module DealsHelper
  def make_deals(deals)
    html_values = ''
    deals.each do |dl|
      html_values << deals_body(dl)
    end
    html_values.html_safe
  end

  def deals_body(obj)
    "<a href='/deals/#{obj.id}'>
    <div>
        <div>
            <p>#{obj.name}</p>
            <p>#{obj.created_at}</p>
        </div>
        <p>Price: $#{obj.amount}</p>
    </div>
    </a>".html_safe
  end
end
