class GroupListController < UITableViewController
  def viewDidLoad
    load_groups_from_server
  end  

  def load_groups_from_server
    @groups = [] 
    BubbleWrap::HTTP.get("http://www.jamesjn.com/simpleapp/groups.json") do |response|
      @groups = BubbleWrap::JSON.parse(response.body.to_str)
      view.reloadData
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @groups.size
  end
  
  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    group = @groups[indexPath.row]
    cell.textLabel.text = group["name"] 
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    group_name = tableView.cellForRowAtIndexPath(indexPath).textLabel.text
    group_tabbar_controller = GroupTabBarController.alloc.initWith(@groups.select{|g| g["name"] == group_name}.first)
    navigationController.pushViewController(group_tabbar_controller, animated:true)
  end

end
