crumb :root do
  link "ホーム", root_path
end

crumb :categories do
	if Product.find(params[:id]).category_id == 1
		link "城島町の地酒", category_sake_path
	
	elsif Product.find(params[:id]).category_id == 2
		link "城島町の雑貨", category_grocery_path
	
	elsif Product.find(params[:id]).category_id == 3
		link "城島町の特産品", category_food_path
	
	else
		link "城島町の工芸品", category_craft_path
	end
	parent :root
end

crumb :product do |product|
	@product = Product.find(params[:id])
	link @product.name, product
	parent :categories
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).