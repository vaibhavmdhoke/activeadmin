module ActiveAdmin
  module Views
    class Footer < Component

      def build(namespace)
        super id: "footer"
        @namespace = namespace

        # footer changes from Arbre https://github.com/activeadmin/arbre
        if footer_text.present?
          para footer_text
        else
          para powered_by_message
        end
      end

      private

      def footer_text
        render 'layouts/footer.html.erb'
        @footer_text ||= @namespace.footer(self)
      end

      def powered_by_message
        I18n.t('active_admin.powered_by',
          active_admin: link_to("Active Admin", "http://www.activeadmin.info"),
          version: ActiveAdmin::VERSION).html_safe
      end

    end
  end
end
