Deface::Override.new(
        :virtual_path => 'spree/products/show',
        :name=> 'add_docs_to_product',
        :insert_after => '[data-hook="product_images"]',
        :text => '


<% unless @product.documents.any? || @product.variant_documents.any? %>
<% else %>
  <h3 class="product-section-title"><%= Spree.t(:documents) %></h3>
  <table class="table" style="font-size: small" data-hook="documents_table">
    <thead>
      <tr data-hook="documents_header">
        <th><%= Spree.t(:document_url) %></th>
        <% if @product.has_variants? %>
          <th><%= Spree::Variant.model_name.human %></th>
        <% end %>
      </tr>
    </thead>




    <tbody>
      <% (@product.variant_documents).each do |document| %>
        <tr data-hook="documents_row">
          <td>
            <% if !document.alt? %>
             <%= link_to document.attachment_file_name, document.attachment.url(:product) %>
            <% else %>
             <%= link_to document.alt, document.attachment.url(:product) %>
            <% end %> 
 
          </td>
          <% if @product.has_variants? %>
            <td><%= options_text_for(document) %></td>
          <% end %>
        </tr>
      <% end %>
    </tbody>
 </table>
<% end %>
    '
        )
