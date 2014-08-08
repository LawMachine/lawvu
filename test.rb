tis is a test file
<h2>Client</h2>
<p><%=@matter.client.first_name%> <%=@matter.client.last_name%></p>

<% if @matter.issue.present? %>
<h2>Issue</h2>
<p><%=@matter.issue%></p>
<% end %>

<% if @matter.help_asked_by_client.present? %>
<h2>Help asked by client</h2>
<p><%=@matter.help_asked_by_client%></p>
<% end %>

<% if @matter.fee_arrangement_by_client.present? %>
<h2>Fee arrangement by client</h2>
<p><%=JSON.parse(ENV["FEE_ARRANGEMENT"])[@matter.fee_arrangement_by_client]%></p>
<% end %>

<% if @matter.budget.present? %>
<h2>Client Budget</h2>
<p><%=@matter.budget%></p>
<% end %>

<% if @matter.client_reference.present? %>
<h2>Reference</h2>
<p><%=@matter.client_reference%></p>
<% end %>

<% if @matter.timeframe.present? %>
<h2>Timeframe</h2>
<p><%=@matter.timeframe%></p>
<% end %>

<% if @matter.pending_at == "lawyer" and @matter.status == 0 %>
<a href="<%=edit_matter_path(@matter)%>" class="btn btn-primary btn-large">Make Changes</a>
<a href="<%=accept_matter_path(@matter)%>" class="btn btn-success btn-large">Accept</a>
<% else %> 
<div class="alert alert-info">
<%=JSON.parse(ENV["MATTER_STATUS"])[@matter['status']] %>
</div>
<% end %>

  <div class="row-fluid">
    <div class="span5">
			<div class="widget-box">
				<div class="widget-header widget-header-flat widget-header-small">
					<h5>
						Matter Summary
					</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main">
						<div id="piechart-placeholder"></div>

						<div class="hr hr8 hr-double"></div>

						<div class="clearfix">
							<div class="grid3">
								<span class="grey">
									<i class="icon-facebook-sign icon-2x blue"></i>
									&nbsp; likes
								</span>
								<h4 class="bigger pull-right">1,255</h4>
							</div>

							<div class="grid3">
								<span class="grey">
									<i class="icon-twitter-sign icon-2x purple"></i>
									&nbsp; tweets
								</span>
								<h4 class="bigger pull-right">941</h4>
							</div>

							<div class="grid3">
								<span class="grey">
									<i class="icon-pinterest-sign icon-2x red"></i>
									&nbsp; pins
								</span>
								<h4 class="bigger pull-right">1,050</h4>
							</div>
						</div>
					</div><!--/widget-main-->
				</div><!--/widget-body-->
			</div><!--/widget-box-->
		</div><!--/span-->
	</div><!--/row-->
  <div class="row-fluid">
    <div class="span6">
      <div class="widget-box">
        <div class="widget-header widget-header-flat">
          <h4>Matter Summary</h4>
        </div>

        <div class="widget-body">
          <div class="widget-main">
            <div class="row-fluid">
              <div class="span6">
                <ul>
                  <li>Unordered List Item # 1</li>

                  
                </ul>
              </div>

              <div class="span6">
                <ol>
                  <li>Ordered List Item # 1</li>
                  
                </ol>
              </div>
            </div>

            <hr />
            <div class="row-fluid">
              <div class="span12">
                <ul class="unstyled spaced">
                  <li>
                    <i class="icon-bell purple"></i>
                    List with custom icons and more space
                  </li>
                </ul>

                <ul class="unstyled spaced2">
                  <li>
                    <i class="icon-circle green"></i>
                    Even more space
                  </li>

                  <li class="text-warning orange">
                    <i class="icon-warning-sign"></i>
                    Unordered List Item # 5
                  </li>

                  <li class="muted">
                    <i class="icon-angle-right"></i>
                    Unordered List Item # 6
                  </li>

                  <li>
                    <ul class="inline">
                      <li>
                        <i class="icon-share-alt green"></i>
                        Inline List Item # 1
                      </li>
                      <li>List Item # 2</li>
                      <li>List Item # 3</li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div><!--/span-->
  </div>
  <div class="row-fluid">
              <div class="span4">
                <div class="widget-box">
                  <div class="widget-header widget-header-flat">
                    <h4>BlockQuote & Address</h4>
                  </div>

                  <div class="widget-body">
                    <div class="widget-main">
                      <div class="row-fluid">
                        <blockquote class="pull-right">
                          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>

                          <small>
                            Someone famous
                            <cite title="Source Title">Source Title</cite>
                          </small>
                        </blockquote>
                      </div>

                      <blockquote>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>

                        <small>
                          Someone famous
                          <cite title="Source Title">Source Title</cite>
                        </small>
                      </blockquote>

                      <hr />
                      <address>
                        <strong>Twitter, Inc.</strong>

                        <br />
                        795 Folsom Ave, Suite 600
                        <br />
                        San Francisco, CA 94107
                        <br />
                        <abbr title="Phone">P:</abbr>
                        (123) 456-7890
                      </address>

                      <address>
                        <strong>Full Name</strong>

                        <br />
                        <a href="mailto:#">first.last@example.com</a>
                      </address>
                    </div>
                  </div>
                </div>
              </div>

              <div class="span8">
                <div class="row-fluid">
                  <div class="widget-box">
                    <div class="widget-header widget-header-flat">
                      <h4>Definition List</h4>

                      <div class="widget-toolbar">
                        <label>
                          <small class="green">
                            <b>Horizontal</b>
                          </small>

                          <input id="id-check-horizontal" type="checkbox" class="ace-switch ace-switch-6" />
                          <span class="lbl" for="id-check-horizontal"></span>
                        </label>
                      </div>
                    </div>

                    
                  </div>
                </div>
                
              </div>
            </div>











            <h3 class="header smaller lighter grey">
											<i class="icon-spinner icon-spin orange bigger-125"></i>
											Imageless Spinner
											<small>(spin.js)</small>
										</h3>


										class="center"

