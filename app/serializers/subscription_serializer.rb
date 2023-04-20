class SubscriptionSerializer
  def self.format_subscription(subscription)
    {
      "data": {
        "type": "subscription",
        "id": subscription.id,
        "customer_id": subscription.customer_id,
        "attributes": {
          "title": subscription.title,
          "price": "$#{subscription.price}",
          "status": subscription.status,
          "frequency": subscription.frequency
        },
        "relationships":
          TeaSerializer.format_tea(subscription.tea)
      }
    }
  end
end