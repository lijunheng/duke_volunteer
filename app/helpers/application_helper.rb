module ApplicationHelper
	def sortable(column, title = nil)
        title ||= column.titleize
        css_class = column == sort_column ? "current #{sort_direction}" : nil
        direction = sort_direction == "asc" ? "desc" : "asc"
        link_to "#{title} <i class='#{direction == "desc" ? "icon-chevron-down" : "icon-chevron-up"}'></i>".html_safe, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
	end

	def markdown(text)
	    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(
	        :hard_wrap => true, :filter_html => true, :safe_links_only => true),
	        :no_intraemphasis => true, :autolink => true)
	    return markdown.render(text).html_safe
  	end
end
