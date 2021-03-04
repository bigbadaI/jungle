class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  def show
    @products = Product.order(id: :desc).all
    @counts = dashboard_counts @products
  end

  def dashboard_counts (items)
    ans = {}
    items.each do | i |
      if (!ans[i.category.name])
        ans.store("#{i.category.name}", 1)
      else
        ans[i.category.name] += 1
      end
    end
    return ans
  end
end
