<div class="container-fluid">
  <div class="row-fluid">
    {{range .Sites}}
      <!-- <a href="{{.Address}}" name="{{.Name}}" /> -->
      <ul class="nav">
      	<li><a href="{{.Address}}" target="_blank">{{.Name}}</a></li>
      </ul>
    {{end}}
  </div>
</div>

<!-- Button to trigger modal -->
<a href="#myModal" role="button" class="btn" data-toggle="modal">Add New Site</a>
 
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Adding site:</h3>
  </div>
  <div class="modal-body">
    <form method="post">
      <div class="control-group">
        <label class="control-label">Site Name:</label>
        <input type="text" name="SiteName" placeholder="Name easy to remember...">

        <label class="control-label">Site Type:</label>
        <div class="controls">
          <select name="SiteType" id="SiteType">
            <option value="Music">Music</option>
            <option value="Video">Video</option>
            <option value="Technology">Technology</option>
            <option value="Sports">Sports</option>
            <option value="Shopping">Shopping</option>
            <option value="Game">Game</option>
          </select>
        </div>

        <label class="control-label">Site Address:</label>
        <input type="text" name="SiteAddress" placeholder="www.google.com">
        <label class="control-label">Organization:</label>
        <div class="input-append">
          <input class="span2" id="appendedInput" type="text" name="Organization"  placeholder="google">
          <span class="add-on">Inc</span>
        </div>
      </div>

      <div class="btn-toolbar">
            <button class="btn btn-primary" type="submit"><i class="icon-save"></i> Save </button>
      </div>
    </form>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>