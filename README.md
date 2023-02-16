# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Changed username
<h1>Showing Employee details</h1>
  <p><strong>Name: </strong><%= @employee.name %></p>
  <p><strong>Company: </strong><%= @employee.company.name %></p>
  <p><strong>phonenumber: </strong><%= @employee.phonenumber %></p>
  <p><strong>Email: </strong><%= @employee.email%></p>
  <p><strong>Gender:</strong><%=@employee.gender %></p>
  <p><strong>Salary:</strong><%= @employee.salary%></p>
  <p><strong>Experience:</strong><%= @employee.experience%></p>
   <%= link_to 'Edit', edit_employee_path(@employee) %>
   <%= link_to 'Delete' , employee_path(@employee), data: {turbo_method: :delete, turbo_confirm: 'Are you sure want to delete?'} %>
   <%= link_to 'Return to employees listing page', employees_path %> |
   <%= link_to 'Add project', new_project_path(employee_id: @employee.id)%>
 
 <%if @company == Company.all%>
  <p> 
    <%=form.label("Select Company:")%>
    <%= form.collection_select :company_id, Company.order(:name),:id,:name, include_blank: "-none-"%>
  </p>
    <%else%>
    <%=form.hidden_field :company_id, value: params[:company_id]%>
  <% end %>