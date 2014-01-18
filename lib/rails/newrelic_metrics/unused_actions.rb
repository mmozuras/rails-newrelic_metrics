module Rails
  module NewRelicMetrics
    class UnusedActions < Struct.new(:api_key, :app_id)
      def for(controller)
        metric_names = metric_names(controller)
        unused(metric_names)
      end

      def all
        controllers.map { |controller| metric_names(controller) }
                   .flatten
                   .each_slice(100)
                   .map { |metric_names| unused(metric_names) }
                   .flatten
      end

      private

      def unused(metric_names)
        response = call_counts(metric_names)
        response.select { |metric| metric['call_count'].to_i == 0 }
                .map { |metric| metric['name'][11..metric['name'].length] }
      end

      def call_counts(metric_names)
        metrics = metric_names.map { |metric_name| "metrics[]=#{metric_name}" }.join('&')
        api.json("applications/#{app_id}/data.json?#{metrics}&field=call_count&summary=1&begin=#{two_weeks_ago}&end=#{now}")
      end

      def controllers
        ::ApplicationController.descendants
      end

      def api
        @api ||= API.new(api_key, app_id)
      end

      def metric_names(controller)
        controller.action_methods.map { |action| metric_name(controller, action) }
      end

      def metric_name(controller, action)
        "Controller/#{controller.controller_path}/#{action}"
      end

      def now
        Time.now.utc.iso8601
      end

      def two_weeks_ago
        (Time.now - 60*60*24*30).utc.iso8601
      end
    end
  end
end
