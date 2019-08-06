module NewsGrafana
  class AWSTarget < Target

  def initialize (metricName, namespace, refId, region, statistics, loadBalancerName)
    @loadBalancerName = loadBalancerName
    @metricName = metricName
    @namespace = namespace,
    @refId = refId,
    @region = region,
    @statistics = statistics,
    @period = ""
  end

end