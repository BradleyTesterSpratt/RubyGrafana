module NewsGrafana
  class Target
    def initialize (metricName, namespace, refId, region, statistics, dimensionValue)
      @metricName = metricName,
      @namespace = namespace,
      @refId = refId,
      @region = region,
      @statistics = statistics,
      add_dimension(dimensionValue)
    end

    def add_dimension(value)
      @dimensions = @dimensions || {}
      case @namespace
        when "AWS/ELB" 
          @dimensions.merge!("LoadBalancerName": value)
        when "AWS/ElastiCache"
          @dimensions.merge!("CacheClusterId": value)
        when "AWS/NetworkELB"
          loadBalancer, targetGroup = value.delete(" ").split(",")
          @dimensions.merge!("LoadBalancer": loadBalancer)
          @dimensions.merge!("TargetGroup": targetGroup)
        else 
          @dimensions.merge!("BBCEnvironment": value)
      end
    end

    attr_reader :dimensions
  end
end