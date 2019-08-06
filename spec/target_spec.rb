require 'spec_helper'

describe NewsGrafana::Target do
  let (:metricName) {"dummyMetric"}
  let (:refID) {"A"}
  let (:region) {"eu-west-1"}
  let (:statistics) {"max"}
  let (:dimensionValue) {"dummyValue"}
  subject {described_class.new(metricName, namespace, refID, region, statistics, dimensionValue) }

  describe 'add_dimensions' do
    context 'when the namespace is AWS/ELB it will add the correct dimensions' do
      let (:namespace) {"AWS/ELB"}       
      it 'add the correct dimension type' do
        expect(subject.dimensions).to eq({"LoadBalancerName": "dummyValue"})
      end
    end
    context 'when the namespace is AWS/ElastiCache it will add the correct dimensions' do
      let (:namespace) {"AWS/ElastiCache"}       
      it 'add the correct dimension type' do
        expect(subject.dimensions).to eq({"CacheClusterId": "dummyValue"})
      end
    end
    context 'when the namespace is AWS/NetworkELB it will add the correct dimensions' do
      let (:namespace) {"AWS/NetworkELB"}
      let (:dimensionValue) {"dummyValue, dummyValue2"}     
      it 'add the correct dimension type' do
        expect(subject.dimensions).to eq(
          {
            "LoadBalancer": "dummyValue",
            "TargetGroup": "dummyValue2"
            }
          )
      end 
    end
  end
end