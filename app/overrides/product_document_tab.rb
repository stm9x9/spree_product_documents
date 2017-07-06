Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                 :name => "admin_product_document_tab",
                 :original => '10edf2223cf4fe1ebcd351beb56472f5b623ea6b',
                 :insert_bottom => "[data-hook='admin_product_tabs']",
                 :text => "
                  <%= content_tag :li, :class => ('active' if current == 'Documents') do %>
                    <%= link_to_with_icon 'file', I18n.t('spree.admin.tab.documents'), admin_product_documents_path(@product) %>
                  <% end if can?(:admin, Spree::Document) %>
                ")
