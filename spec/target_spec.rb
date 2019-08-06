module NewsGrafana
  describe NewsGrafana::Target do
    @metricName = "dummyMetric"
    @refID = "A"
    @region = "eu-west-1"
    @statistics = "max"
    @dimensionValue = "dummyValue"

    describe 'add_dimensions' do
      let (:namespace) {"AWS/ELB"}
      subject {Target.new(@metricName, namespace, @refId, @region, @statistics, @dimensionValue) }

      context 'when the namespace is AWS/ELB it will add the correct dimensions' do
        it 'add the correct dimension type' do
          expect(subject.dimensions).to equal({"LoadBalancerName": "dummyValue"})
        end
      end
    end
  end
end