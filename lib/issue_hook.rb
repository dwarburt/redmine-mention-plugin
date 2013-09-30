module Mention
  module Hooks
    class ViewLayoutsBaseHtmlHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        if context[:controller] && (context[:controller].is_a?(IssuesController))
          tags = javascript_include_tag('jquery.caretposition.js', :plugin => 'redmine_mention_plugin')
          tags << javascript_include_tag('jquery.sew.js', :plugin => 'redmine_mention_plugin')
          tags << javascript_include_tag('redmine_mention_plugin.js', :plugin => 'redmine_mention_plugin')
          tags << stylesheet_link_tag('redmine_mention_plugin.css', :plugin => 'redmine_mention_plugin')
        end
      end
    end
  end
end
