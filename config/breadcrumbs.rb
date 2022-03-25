crumb :root do
  link "Home", root_path
end

crumb :NewItems do
  link "マスター登録", new_item_path
  parent :root
end

crumb :NewOrderItem do |item|
  link "オーダー注文"
  parent :ShowItem, item
end

crumb :EditOrderItem do
  link "オーダー確認", edit_item_order_path
  parent :root
end

crumb :ShowItem do |item|
  link "商品詳細", item_path(item)
  parent :root
end

crumb :EditItem do |item|
  link "商品編集"
  parent :ShowItem, item
end

crumb :SearchItems do
  link "詳細検索", search_items_path
  parent :root
end

crumb :AllEditItems do
  link "在庫一括修正", all_edit_items_path
  parent :root
end

crumb :Schedule do
  link "スケジュール", schedules_path
  parent :root
end

crumb :Mypage do
  link "マイページ", user_path
  parent :root
end


crumb :NewRelease do
  link "新機能検証用", new_release_items_path
  parent :root
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