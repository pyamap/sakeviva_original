require File.expand_path('../../test_helper', __FILE__)

module Stripe
  class DisputeTest < Test::Unit::TestCase
    should "be listable" do
      disputes = Stripe::Dispute.list
      assert_requested :get, "#{Stripe.api_base}/v1/disputes"
      assert disputes.data.kind_of?(Array)
      assert disputes.first.kind_of?(Stripe::Dispute)
    end

    should "be retrievable" do
      dispute = Stripe::Dispute.retrieve("dp_123")
      assert_requested :get, "#{Stripe.api_base}/v1/disputes/dp_123"
      assert dispute.kind_of?(Stripe::Dispute)
    end

    should "be saveable" do
      dispute = Stripe::Dispute.retrieve("dp_123")
      dispute.metadata['key'] = 'value'
      dispute.save
      assert_requested :post, "#{Stripe.api_base}/v1/disputes/#{dispute.id}"
    end

    should "be updateable" do
      dispute = Stripe::Dispute.update("dp_123", metadata: { key: 'value' })
      assert_requested :post, "#{Stripe.api_base}/v1/disputes/dp_123"
      assert dispute.kind_of?(Stripe::Dispute)
    end

    context "#close" do
      should "be closeable" do
        dispute = Stripe::Dispute.retrieve("dp_123")
        dispute.close
        assert_requested :post,
          "#{Stripe.api_base}/v1/disputes/#{dispute.id}/close"
      end
    end
  end
end
