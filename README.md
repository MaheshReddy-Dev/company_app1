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
<p id="notice"><%= notice %></p>
<div class="flex justify-between items-center">
  <h1 class="font-bold text-4xl">Companies</h1>
  <%= turbo_frame_tag "new_company" do %>
 <%= link_to 'New Company', new_company_path, class: "rounded-lg py-3 px-5 bg-red-100 inline-block font-medium" %>
 <% end %>
</div>



 <tbody id= "companies">
	   	<%= render @companies %>
  </tbody>
